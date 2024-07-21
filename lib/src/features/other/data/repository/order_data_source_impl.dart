import 'package:dartz/dartz.dart';
import 'package:hungyhub/src/core/network/error/erro.dart';
import 'package:hungyhub/src/core/network/success/success.dart';
import 'package:hungyhub/src/features/other/data/source/remote/order_remote.dart';
import 'package:hungyhub/src/features/other/domain/repository/order.dart';

class OrderDataSourceImpl extends OrderRepository {
  final OrderRemoteDataSource source;

  OrderDataSourceImpl({required this.source});

  @override
  Future<Either<ErrorResponse, SuccessResponse<bool>>> store(Map<String, dynamic> item) async {
    try {
      bool isSuccess = await source.store(item);
      return Right(SuccessResponse(data: isSuccess));
    } on ErrorResponse catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ErrorResponse(msg: e.toString()));
    }
  }
}
