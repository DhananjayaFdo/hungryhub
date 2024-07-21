import 'package:dartz/dartz.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/core/network/success/success.dart';
import 'package:hungyhub/src/features/other/domain/entity/product.dart';
import 'package:hungyhub/src/features/other/domain/repository/product.dart';

class ProductsUseCase {
  final ProductRepository repository;

  ProductsUseCase({required this.repository});

  Future<Either<ErrorResponse, SuccessResponse<List<ProductEntity>>>> list() {
    return repository.list();
  }
}
