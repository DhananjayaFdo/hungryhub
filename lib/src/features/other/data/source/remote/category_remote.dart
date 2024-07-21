import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/features/other/data/model/category.dart';

import '../../../../../core/network/config.dart';

class CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSource({required this.dio});

  Future<List<CategoryModel>> list() async {
    String message = "LIST CATEGORY API GET DATA";

    try {
      Response response = await dio.get(
        "${NetworkConfig.baseurl}/categories",
        options: Options(
          headers: {
            "authorization": "Bearer ${dotenv.env['API_KEY'] ?? ''}",
            "accept": 'application/json',
          },
        ),
      );

      // print(response.data['Status']);
      var body = json.decode(response.data);

      if (body['Status']) {
        List data = body['Result'];

        List<CategoryModel> messages = data.map((e) => CategoryModel.fromJson(e)).toList();
        return messages;
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
