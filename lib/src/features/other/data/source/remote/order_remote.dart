import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/features/other/data/model/product.dart';

import '../../../../../core/network/config.dart';

class OrderRemoteDataSource {
  final Dio dio;

  OrderRemoteDataSource({required this.dio});

  Future<bool> store(Map<String, dynamic> item) async {
    String message = "STORE ORDER API DATA";

    try {
      Response response = await dio.post(
        "${NetworkConfig.baseurl}/place/order",
        data: item,
        options: Options(
          headers: {
            "authorization": "Bearer ${dotenv.env['API_KEY'] ?? ''}",
            "accept": 'application/json',
          },
        ),
      );

      var body = json.decode(response.data);

      if (body['Status']) {
        return body['Status'];
      } else {
        ErrorResponse exception = ErrorResponse(
          code: response.statusCode,
          msg: response.statusMessage,
        );
        log('$message ERROR => ${exception.msg}');
        throw exception;
      }
    } on DioException catch (e) {
      log('$message DIO ERROR => $e');
      throw ErrorResponse(
        code: e.response?.statusCode,
        msg: e.response?.statusMessage,
      );
    } catch (e, stacktrace) {
      log('$message ERROR => $e');
      log('$message ERROR STACKTRACE => $stacktrace');
      throw ErrorResponse(msg: e.toString());
    }
  }
}
