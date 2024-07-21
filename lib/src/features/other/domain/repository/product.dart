import 'package:dartz/dartz.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/core/network/success/success.dart';
import 'package:hungyhub/src/features/other/domain/entity/product.dart';

import '../../../../core/utils/params/product.dart';

abstract class ProductRepository {
  Future<Either<ErrorResponse, SuccessResponse<List<ProductEntity>>>> list(ProductParams params);
}
