import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/features/other/data/model/product.dart';

import '../../../../../core/network/config.dart';

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource({required this.dio});

  Future<List<ProductModel>> list() async {
    String message = "LIST PRODUCT API GET DATA";

    try {
      Response response = await dio.get(
        "${NetworkConfig.baseurl}/categories/items",
        queryParameters: {
          'page': 1,
        },
        options: Options(
          headers: {
            "authorization": "Bearer ${NetworkConfig.token}",
            "accept": 'application/json',
          },
        ),
      );

      var body = json.decode(response.data);

      if (body['Status']) {
        List data = body['Result'];

        List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();
        return products;
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
