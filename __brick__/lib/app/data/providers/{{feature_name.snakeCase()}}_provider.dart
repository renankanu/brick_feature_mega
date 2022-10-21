import 'package:mega_commons/mega_commons.dart';

class {{feature_name.pascalCase()}}Provider {
  final RestClientDio _restClientDio;

  {{feature_name.pascalCase()}}Provider({required RestClientDio restClientDio})
      : _restClientDio = restClientDio;

  Future<MegaResponse> onSubmitRequest() async {
    final response = await _restClientDio.get('');
    return response;
  }
}