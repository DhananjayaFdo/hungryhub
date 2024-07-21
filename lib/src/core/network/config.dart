import 'dart:developer';

import 'package:dio/dio.dart';

class NetworkConfig {
  static const String baseurl = "https://assignment-dev.endpoints.custom-graph-425805-c1.cloud.goog/v1";

// Future<Response> get({required Dio dio, required String url, Map<String, dynamic>? queryParameters}) async {
//   log(url);
//   // token = await SharedPrefRepo(sharedPreferences: await SharedPreferences.getInstance()).readString(SharedPrefRepo.token) ?? '';
//
//   return dio.get(
//     url,
//     queryParameters: queryParameters,
//     options: Options(
//       headers: _header(),
//     ),
//   );
// }
//
// Future<Response> post({required Dio dio, required String url, Object? data}) async {
//   log(url);
//   // token = await SharedPrefRepo(sharedPreferences: await SharedPreferences.getInstance()).readString(SharedPrefRepo.token) ?? '';
//
//   return dio.post(
//     url,
//     data: data,
//     options: Options(
//       headers: _header(),
//     ),
//   );
// }

// Map<String, dynamic>? _header() => {
//       "authorization": "Bearer $token",
//       "accept": 'application/json',
//     };
}
