import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungyhub/src/core/utils/params/product.dart';
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
  ProductsBloc() : super(ProductsInitial(page: 1)) {
    on<ProductInitialEvent>(productInitialEvent);
    on<HomeProductLoadingEvent>(homeProductLoadingEvent);
    on<ProductLoadMoreProductEvent>(productLoadMoreProductEvent);
  }

  FutureOr<void> productInitialEvent(ProductInitialEvent event, Emitter<ProductsState> emit) async {
    emit(HomeProductsLoadingState());

    Either<ErrorResponse, SuccessResponse<List<ProductEntity>>> products = await ProductsUseCase(
      repository: ProductDataSourceImpl(
        source: ProductRemoteDataSource(
          dio: Dio(),
        ),
      ),
    ).list(
      ProductParams(page: 1),
    );

    products.fold((l) {
      emit(HomeProductsErrorState());
    }, (r) {
      emit(HomeProductsLoadedState(products: r.data));
    });
  }

  FutureOr<void> productLoadMoreProductEvent(ProductLoadMoreProductEvent event, Emitter<ProductsState> emit) async {
    emit(HomeMoreProductLoadingState());

    int page = 1;

    Either<ErrorResponse, SuccessResponse<List<ProductEntity>>> products = await ProductsUseCase(
      repository: ProductDataSourceImpl(
        source: ProductRemoteDataSource(
          dio: Dio(),
        ),
      ),
    ).list(
      ProductParams(page: page += 1),
    );

    products.fold((l) {
      emit(HomeMoreProductErrorState());
    }, (r) {
      emit(HomeMoreProductLoadedState());
    });
  }

  FutureOr<void> homeProductLoadingEvent(HomeProductLoadingEvent event, Emitter<ProductsState> emit) async {
    if (!event.isLoadMore) emit(HomeMoreProductLoadingState());

    Either<ErrorResponse, SuccessResponse<List<ProductEntity>>> products = await ProductsUseCase(
      repository: ProductDataSourceImpl(
        source: ProductRemoteDataSource(
          dio: Dio(),
        ),
      ),
    ).list(
      ProductParams(page: event.page),
    );

    products.fold((l) {
      emit(HomeProductsErrorState());
    }, (r) {
      List<ProductEntity> productList = [];
      productList.addAll(r.data);

      print(productList.length);

      emit(HomeProductsLoadedState(products: productList));
    });
  }
}
