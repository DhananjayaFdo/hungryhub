import 'package:dartz/dartz.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/core/network/success/success.dart';
import 'package:hungyhub/src/features/other/domain/repository/order.dart';

class OrderUseCase {
  final OrderRepository repository;

  OrderUseCase({required this.repository});

  Future<Either<ErrorResponse, SuccessResponse<bool>>> store(Map<String, dynamic> item) {
    return repository.store(item);
  }
}
