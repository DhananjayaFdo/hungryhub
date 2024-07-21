import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hungyhub/src/features/other/domain/entity/unit_type.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/sqflite/db_helper.dart';
import '../../../domain/entity/db/product.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(CartInitial()) {
    on<CartCountBtnClickEvent>(cartCountBtnClickEvent);
    on<CartInitialUnitTypeSetEvent>(cartInitialUnitTypeSetEvent);
    on<CartAddToCartBtnClickEvent>(cartAddToCartBtnClickEvent);
  }

  FutureOr<void> cartCountBtnClickEvent(CartCountBtnClickEvent event, Emitter<ProductState> emit) {
    int count = 0;

    emit(CartCountBtnClickState(count: count));
  }

  FutureOr<void> cartInitialUnitTypeSetEvent(CartInitialUnitTypeSetEvent event, Emitter<ProductState> emit) {
    emit(SelectedUnitTypeState(unitTypes: event.unitType));
  }

  FutureOr<void> cartAddToCartBtnClickEvent(CartAddToCartBtnClickEvent event, Emitter<ProductState> emit) {
    try {
      final dbHelper = DatabaseHelper.instance;
      dbHelper.addItemToCart(itemData: event.cartItem);

      log('PRODUCT ADD TO CART SUCCESS');
      emit(CartItemAddToCartSuccessState());
    } catch (e) {
      log('PRODUCT ADD TO CART FAILED');
      emit(CartItemAddToCartFailedState());
    }
  }
}
