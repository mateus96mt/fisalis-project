import 'package:dio/dio.dart';

class ElasticSearchController {
  static const String baseUrl =
      'https://test-1ee240.es.us-west1.gcp.cloud.es.io:9243/clothes';

  static String accessToken = 'ZWxhc3RpYzpFQWhMUVNjY2p1emVsdDg5UnhUVjZBVHE=';

  static Future<Response> getClothes() {
    var dio = Dio();

    return dio.get(
      '$baseUrl/_search',
      options: Options(
        headers: <String, String>{'authorization': 'Basic $accessToken'},
      ),
    );
  }
}
