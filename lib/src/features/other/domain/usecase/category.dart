import 'package:dartz/dartz.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/core/network/success/success.dart';
import 'package:hungyhub/src/features/other/domain/entity/category.dart';
import 'package:hungyhub/src/features/other/domain/repository/category.dart';

class CategoryUseCase {
  final CategoryRepository repository;

  CategoryUseCase({required this.repository});

  Future<Either<ErrorResponse, SuccessResponse<List<CategoryEntity>>>> list() {
    return repository.list();
  }
}
