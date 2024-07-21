import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungyhub/src/features/other/data/repository/product_data_source_impl.dart';
import 'package:hungyhub/src/features/other/data/source/remote/product_remote.dart';
import 'package:hungyhub/src/features/other/domain/usecase/product.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/network/error/erro.dart';
import '../../../../../../core/network/success/success.dart';
import '../../../../domain/entity/product.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductInitialEvent>(productInitialEvent);
  }

  FutureOr<void> productInitialEvent(ProductInitialEvent event, Emitter<ProductsState> emit) async {
    emit(HomeProductsLoadingState());

    Either<ErrorResponse, SuccessResponse<List<ProductEntity>>> products = await ProductsUseCase(
      repository: ProductDataSourceImpl(
        source: ProductRemoteDataSource(
          dio: Dio(),
        ),
      ),
    ).list();

    products.fold((l) {
      emit(HomeProductsErrorState());
    }, (r) {
      emit(HomeProductsLoadedState(products: r.data));
    });
  }
}
