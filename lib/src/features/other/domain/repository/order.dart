import 'package:dartz/dartz.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/core/network/success/success.dart';

abstract class OrderRepository {
  Future<Either<ErrorResponse, SuccessResponse<bool>>> store(Map<String, dynamic> item);
}
