import 'package:dartz/dartz.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/core/network/success/success.dart';
import 'package:hungyhub/src/features/other/domain/entity/category.dart';

abstract class CategoryRepository {
  Future<Either<ErrorResponse, SuccessResponse<List<CategoryEntity>>>> list();
}
