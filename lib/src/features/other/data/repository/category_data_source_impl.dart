import 'package:dartz/dartz.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/core/network/success/success.dart';
import 'package:hungyhub/src/features/other/data/model/category.dart';
import 'package:hungyhub/src/features/other/data/source/remote/category_remote.dart';
import 'package:hungyhub/src/features/other/domain/entity/category.dart';
import 'package:hungyhub/src/features/other/domain/repository/category.dart';

class CategoryDataSourceImpl extends CategoryRepository {
  final CategoryRemoteDataSource source;

  CategoryDataSourceImpl({required this.source});

  @override
  Future<Either<ErrorResponse, SuccessResponse<List<CategoryModel>>>> list() async {
    try {
      List<CategoryModel> categories = await source.list();
      return Right(SuccessResponse(data: categories));
    } on ErrorResponse catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ErrorResponse(msg: e.toString()));
    }
  }
}
