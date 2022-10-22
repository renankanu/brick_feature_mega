import 'dart:convert';
import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  await addPage(context);
  await addRoute(context);
}

Future<void> addRoute(HookContext context) async {
  var routesFile = File('lib/app/routes/app_routes.dart');
  String content = _formatterDartFile(routesFile.readAsStringSync());
  var declareRoute = 'static const {{feature_name.camelCase()}} =';
  content = content.appendClassContent(
      'Routes', '$declareRoute _Paths.{{feature_name.camelCase()}};');
  content = content.appendClassContent(
      '_Paths', "$declareRoute '/{{feature_name.paramCase()}}';");

  routesFile.createSync(recursive: true);
  content = sortImports(content);
  routesFile.writeAsStringSync(content);
  await Process.run(
    "dart",
    ["format", routesFile.path],
  );
}

Future<void> addPage(HookContext context) async {
  var appPagesFile = File('lib/app/routes/app_pages.dart');
  var lines = <String>[];
  var content = _formatterDartFile(appPagesFile.readAsStringSync());
  lines = LineSplitter.split(content).toList();
  var indexRoutes = lines
      .indexWhere((element) => element.trim().contains('static final routes'));
  var index =
      lines.indexWhere((element) => element.contains('];'), indexRoutes);
  var name = '{{feature_name}}';
  var line = '''    GetPage(
      name: _Paths.{{feature_name.camelCase()}}, 
      page:()=> const {{feature_name.pascalCase()}}View(),
      binding: {{feature_name.pascalCase()}}Binding(),
    ),
''';
  lines.insert(index, line);

  lines.insert(0, "import '../modules/${name}/bindings/${name}_binding.dart';");
  lines.insert(0, "import '../modules/${name}/views/${name}_view.dart';");

  appPagesFile.createSync(recursive: true);
  final sortedLines = sortImports(lines.join('\n'));
  appPagesFile.writeAsStringSync(sortedLines);
  await Process.run(
    "dart",
    ["format", appPagesFile.path],
  );
}

String _formatterDartFile(String content) {
  var formatter = DartFormatter();
  return formatter.format(content);
}

extension StringExt on String {
  String appendClassContent(String className, String value) {
    var matches =
        RegExp('class $className {.*?(^})', multiLine: true, dotAll: true)
            .allMatches(this);
    var match = matches.first;
    return insert(match.end - 1, value);
  }

  String insert(int index, String value) {
    var newValue = substring(0, index) + value + substring(index);
    return newValue;
  }
}

String sortImports(
  String content,
) {
  content = _formatterDartFile(content);
  var lines = LineSplitter.split(content).toList();

  var contentLines = <String>[];

  var library = <String>[];
  var dartImports = <String>[];
  var flutterImports = <String>[];
  var packageImports = <String>[];
  var projectRelativeImports = <String>[];
  var projectImports = <String>[];
  var exports = <String>[];

  var stringLine = false;
  for (var i = 0; i < lines.length; i++) {
    if (lines[i].startsWith('import ') &&
        !stringLine &&
        lines[i].endsWith(';')) {
      if (lines[i].contains('dart:')) {
        dartImports.add(lines[i]);
      } else if (lines[i].contains('package:flutter/')) {
        flutterImports.add(lines[i]);
      } else if (!lines[i].contains('package:')) {
        projectRelativeImports.add(lines[i]);
      } else if (lines[i].contains('package:')) {
        if (!lines[i].contains('package:flutter/')) {
          packageImports.add(lines[i]);
        }
      }
    } else if (lines[i].startsWith('export ') &&
        lines[i].endsWith(';') &&
        !stringLine) {
      exports.add(lines[i]);
    } else if (lines[i].startsWith('library ') &&
        lines[i].endsWith(';') &&
        !stringLine) {
      library.add(lines[i]);
    } else {
      var containsThreeQuotes = lines[i].contains("'''");
      if (containsThreeQuotes) {
        stringLine = !stringLine;
      }
      contentLines.add(lines[i]);
    }
  }

  if (dartImports.isEmpty &&
      flutterImports.isEmpty &&
      packageImports.isEmpty &&
      projectImports.isEmpty &&
      projectRelativeImports.isEmpty &&
      exports.isEmpty) {
    return content;
  }

  dartImports.sort();
  flutterImports.sort();
  packageImports.sort();
  projectImports.sort();
  projectRelativeImports.sort();
  exports.sort();
  library.sort();

  var sortedLines = <String>[];

  sortedLines.addAll([
    ...library,
    '',
    ...dartImports,
    '',
    ...flutterImports,
    '',
    ...packageImports,
    '',
    ...projectImports,
    '',
    ...projectRelativeImports,
    '',
    ...exports,
    '',
    ...contentLines
  ]);

  return _formatterDartFile(sortedLines.join('\n'));
}
