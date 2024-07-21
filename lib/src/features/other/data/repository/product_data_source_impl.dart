import 'package:dartz/dartz.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/core/network/success/success.dart';
import 'package:hungyhub/src/core/utils/params/product.dart';
import 'package:hungyhub/src/features/other/data/model/product.dart';
import 'package:hungyhub/src/features/other/data/source/remote/product_remote.dart';

import '../../domain/repository/product.dart';

class ProductDataSourceImpl extends ProductRepository {
  final ProductRemoteDataSource source;

  ProductDataSourceImpl({required this.source});

  @override
  Future<Either<ErrorResponse, SuccessResponse<List<ProductModel>>>> list(ProductParams params) async {
    try {
      List<ProductModel> products = await source.list(params);
      return Right(SuccessResponse(data: products));
    } on ErrorResponse catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ErrorResponse(msg: e.toString()));
    }
  }
}
