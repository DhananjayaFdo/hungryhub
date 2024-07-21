import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungyhub/src/core/utils/params/product.dart';
import 'package:hungyhub/src/features/other/data/repository/product_data_source_impl.dart';
import 'package:hungyhub/src/features/other/data/source/remote/product_remote.dart';
import 'package:hungyhub/src/features/other/domain/entity/category.dart';
import 'package:hungyhub/src/features/other/domain/usecase/product.dart';
import 'package:hungyhub/src/features/other/screens/home/bloc/category/category_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/network/error/erro.dart';
import '../../../../../core/network/success/success.dart';
import '../../../domain/entity/product.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryInitialEvent>(categoryInitialEvent);
  }

  FutureOr<void> categoryInitialEvent(CategoryInitialEvent event, Emitter<CategoryState> emit) async {
    emit(ProductByCategoryLoadingState());

    Either<ErrorResponse, SuccessResponse<List<ProductEntity>>> products = await ProductsUseCase(
      repository: ProductDataSourceImpl(
        source: ProductRemoteDataSource(
          dio: Dio(),
        ),
      ),
    ).list(
      ProductParams(
        page: 1,
        categoryId: event.category.id,
      ),
    );

    products.fold((l) {
      emit(ProductByCategoryErrorState());
    }, (r) {
      emit(ProductByCategoryLoadedState(product: r.data));
    });
  }
}
