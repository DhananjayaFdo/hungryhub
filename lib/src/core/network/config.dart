import 'dart:developer';

import 'package:dio/dio.dart';

class NetworkConfig {
  static const String baseurl = "https://assignment-dev.endpoints.custom-graph-425805-c1.cloud.goog/v1";

  static String token = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhc3NpZ25tZW50LWRldi5lbmRwb2ludHMuY3VzdG9tLWdyYXBoLTQyNTgwNS1jMS5jbG91ZC5nb29nIiwiZXhwIjoxNzE5NzEwNDg4LCJpc3MiOiJlY28tYXNzaWdubWVudEBjdXN0b20tZ3JhcGgtNDI1ODA1LWMxLmlhbS5nc2VydmljZWFjY291bnQuY29tIn0.jlYTf-giedwx2g1hvQ8W7fgCYj2IK2yhZ6NO8FJd4uHl_jwoAZnn84d0vy8XG7HcSkr5342xHg_Cb4NUFkJWAlRQuIPmWJIoxMSjDtyAX3Zx7RLWaAn-Ac0_jUYknxVTQkUgCzUW2cQ99RjdNmtUgLBXoTcGm8GvWKiqzDY2-bX7rALxW2LAt8Xx5eX0WaJJMqZu8Ida0_WgNEmm7J7ngf5cqK0pTurPOu4eBuUIxwu9YHC-tyqAPTBcPdz6XMVLl-2XQJwIkA2GOPIinTS85jyePr5dr0aHWBbAIQ1f3RXWWFSH3Q6uOGxL4ZlsRXPOFgKSYnQOpNn3EDcLGXQH9w';

  Future<Response> get({required Dio dio, required String url, Map<String, dynamic>? queryParameters}) async {
    log(url);
    // token = await SharedPrefRepo(sharedPreferences: await SharedPreferences.getInstance()).readString(SharedPrefRepo.token) ?? '';

    return dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: _header(),
      ),
    );
  }

  Future<Response> post({required Dio dio, required String url, Object? data}) async {
    log(url);
    // token = await SharedPrefRepo(sharedPreferences: await SharedPreferences.getInstance()).readString(SharedPrefRepo.token) ?? '';

    return dio.post(
      url,
      data: data,
      options: Options(
        headers: _header(),
      ),
    );
  }

  Map<String, dynamic>? _header() => {
        "authorization": "Bearer $token",
        "accept": 'application/json',
      };
}
