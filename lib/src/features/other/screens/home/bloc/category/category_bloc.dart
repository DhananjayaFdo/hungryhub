import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hungyhub/src/features/other/data/repository/category_data_source_impl.dart';
import 'package:hungyhub/src/features/other/data/source/remote/category_remote.dart';
import 'package:hungyhub/src/features/other/domain/entity/category.dart';
import 'package:hungyhub/src/features/other/domain/usecase/category.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/network/error/erro.dart';
import '../../../../../../core/network/success/success.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryCardCLickEvent>(categoryCardCLickEvent);
    on<CategoryInitialEvent>(categoryInitialEvent);
  }

  FutureOr<void> categoryCardCLickEvent(CategoryCardCLickEvent event, Emitter<CategoryState> emit) async {
    emit(HomeCategoryCardClickState());
  }

  FutureOr<void> categoryInitialEvent(CategoryInitialEvent event, Emitter<CategoryState> emit) async {
    emit(HomeCategoryLoadingState());

    Either<ErrorResponse, SuccessResponse<List<CategoryEntity>>> categories = await CategoryUseCase(
      repository: CategoryDataSourceImpl(
        source: CategoryRemoteDataSource(
          dio: Dio(),
        ),
      ),
    ).list();

    categories.fold((l) {
      emit(HomeCategoryErrorState());
    }, (r) {
      emit(HomeCategoryLoadedState(categories: r.data));
    });
  }
}
