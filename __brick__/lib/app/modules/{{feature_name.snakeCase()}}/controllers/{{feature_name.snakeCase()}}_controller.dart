import 'package:mega_commons_dependencies/mega_commons_dependencies.dart';

import '../../../data/providers/apagar_provider.dart';

class {{feature_name.pascalCase()}}Controller extends GetxController {
  final {{feature_name.pascalCase()}}Provider _apagarProvider;

  {{feature_name.pascalCase()}}Controller({required {{feature_name.pascalCase()}}Provider apagarProvider})
      : _apagarProvider = apagarProvider;
  @override
  void onInit() {
    //implement onInit
    super.onInit();
  }
}
