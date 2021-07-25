class GithubDataController {
  static String localHostBaseUrl =
      'https://raw.githubusercontent.com/mateus96mt/fisalis_teste/master/local_host_url.txt';

  static String accessToken = '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';

  static dynamic header = {"Authorization": "Bearer $accessToken"};
}
