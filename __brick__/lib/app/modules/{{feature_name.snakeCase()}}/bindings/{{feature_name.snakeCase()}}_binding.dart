import 'package:mega_commons_dependencies/mega_commons_dependencies.dart';

import '../../../data/providers/apagar_provider.dart';
import '../controllers/apagar_controller.dart';

class {{feature_name.pascalCase()}}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<{{feature_name.pascalCase()}}Provider>(
      () => {{feature_name.pascalCase()}}Provider(
        restClientDio: Get.find(),
      ),
    );
    Get.lazyPut<{{feature_name.pascalCase()}}Controller>(
      () => {{feature_name.pascalCase()}}Controller(
        apagarProvider: Get.find(),
      ),
    );
  }
}
