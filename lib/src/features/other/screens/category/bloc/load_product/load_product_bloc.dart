import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hungyhub/src/features/other/screens/category/bloc/provider/category.dart';
import 'package:hungyhub/src/features/other/screens/home/bloc/provider/products.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/network/error/erro.dart';
import '../../../../../../core/network/success/success.dart';
import '../../../../../../core/utils/params/product.dart';
import '../../../../data/repository/product_data_source_impl.dart';
import '../../../../data/source/remote/product_remote.dart';
import '../../../../domain/entity/product.dart';
import '../../../../domain/usecase/product.dart';

part 'load_product_event.dart';

part 'load_product_state.dart';

class LoadProductBloc extends Bloc<LoadProductEvent, LoadProductState> {
  LoadProductBloc() : super(LoadProductInitial()) {
    on<MoreProductLoadEvent>(moreProductLoadState);
  }

  FutureOr<void> moreProductLoadState(MoreProductLoadEvent event, Emitter<LoadProductState> emit) async {
    emit(LoadProductLoadingState());

    Either<ErrorResponse, SuccessResponse<List<ProductEntity>>> products = await ProductsUseCase(
      repository: ProductDataSourceImpl(
        source: ProductRemoteDataSource(
          dio: Dio(),
        ),
      ),
    ).list(
      ProductParams(
        page: event.page,
        categoryId: event.categoryId,
      ),
    );

    products.fold((l) {
      emit(LoadProductErrorState());
    }, (r) {
      if (r.data.isEmpty) {
        emit(LoadProductEmptyState());
      } else {
        ProductByCategoryProvider pro = Provider.of<ProductByCategoryProvider>(event.context, listen: false);
        pro.addProducts(pro.page + 1, r.data);
        emit(LoadProductLoadedState());
      }
    });
  }
}
