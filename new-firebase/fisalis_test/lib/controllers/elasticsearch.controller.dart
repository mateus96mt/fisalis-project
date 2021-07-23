import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sketch/controllers/github.controller.dart';

class ElasticSearchController {
  // static const String baseUrl =
  //     'https://test-1ee240.es.us-west1.gcp.cloud.es.io:9243/clothes';
  // static const String baseUrl = 'https://a8c0e0311baa.ngrok.io/clothes-id';

  // static String accessToken = 'ZWxhc3RpYzpFQWhMUVNjY2p1emVsdDg5UnhUVjZBVHE=';

  static String baseUrl = '';

  static String endpoint = 'clothes-id';

  static Future<Response?> setLocalHostBaseUrl() async {
    return GithubDataController.getLocalHostUrl().then((response) {
      baseUrl = response.data ?? '';
      baseUrl = baseUrl.substring(0, baseUrl.length - 1);
    });
  }

  static Future<Response> getClothes() {
    var dio = Dio();

    return dio.get(
      '$baseUrl/$endpoint/_search',
      options: Options(
          // headers: <String, String>{'authorization': 'Basic $accessToken'},
          ),
    );
  }
}
