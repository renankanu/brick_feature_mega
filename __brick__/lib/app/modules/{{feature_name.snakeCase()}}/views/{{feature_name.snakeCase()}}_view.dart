
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/{{feature_name.snakeCase()}}_controller.dart';

class {{feature_name.pascalCase()}}View extends GetView<{{feature_name.pascalCase()}}Controller> {
  const {{feature_name.pascalCase()}}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{feature_name.pascalCase()}}View'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(
        () {
          return const Center(
            child: Text('{{feature_name.pascalCase()}}View is working'),
          );
        },
      ),
    );
  }
}
