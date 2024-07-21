import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungyhub/src/core/widgets/cus_widgets.dart';
import 'package:hungyhub/src/features/other/data/repository/order_data_source_impl.dart';
import 'package:hungyhub/src/features/other/data/source/remote/order_remote.dart';
import 'package:hungyhub/src/features/other/domain/usecase/order.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/network/error/erro.dart';
import '../../../../../../core/network/success/success.dart';
import '../../../../../../core/services/sqflite/db_helper.dart';
import '../../../../domain/entity/db/product.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartItemIncreaseDecreaseEvent>(cartItemIncreaseDecreaseEvent);
    on<CartItemRemoveClickEvent>(cartItemRemoveClickEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) async {
    try {
      emit(CartLoadingState());

      final dbHelper = DatabaseHelper.instance;
      List<Map<String, dynamic>> products = await dbHelper.readData(table: DatabaseHelper.table);

      if (products.isEmpty) {
        emit(CartEmptyState());
      } else {
        int sub = 0;
        for (var element in products) {
          CartItem item = CartItem.fromMap(element);
          int price = item.price ?? 0;
          int quantity = item.quantity ?? 0;
          int total = price * quantity;
          sub += total;
        }

        emit(CartLoadedState(
          items: products.map((e) => CartItem.fromMap(e)).toList(),
          total: sub,
        ));
      }
    } catch (e) {
      emit(CartEmptyState());
    }
  }

  FutureOr<void> cartItemIncreaseDecreaseEvent(CartItemIncreaseDecreaseEvent event, Emitter<CartState> emit) async {
    try {
      String id = event.id;
      bool isIncrease = event.isIncrease;

      final dbHelper = DatabaseHelper.instance;

      if (isIncrease) {
        await dbHelper.increaseQuantity(id);
      } else {
        await dbHelper.decreaseQuantity(id);
      }

      List<Map<String, dynamic>> products = await dbHelper.readData(table: DatabaseHelper.table);

      if (products.isEmpty) {
        emit(CartEmptyState());
      } else {
        int sub = 0;
        for (var element in products) {
          CartItem item = CartItem.fromMap(element);
          int price = item.price ?? 0;
          int quantity = item.quantity ?? 0;
          int total = price * quantity;
          sub += total;
        }

        emit(CartLoadedState(
          items: products.map((e) => CartItem.fromMap(e)).toList(),
          total: sub,
        ));
      }
    } catch (e) {
      emit(CartEmptyState());
    }
  }

  FutureOr<void> cartItemRemoveClickEvent(CartItemRemoveClickEvent event, Emitter<CartState> emit) async {
    try {
      String id = event.id;

      final dbHelper = DatabaseHelper.instance;

      await dbHelper.removeCartItem(id);

      List<Map<String, dynamic>> products = await dbHelper.readData(table: DatabaseHelper.table);

      if (products.isEmpty) {
        emit(CartEmptyState());
      } else {
        int sub = 0;
        for (var element in products) {
          CartItem item = CartItem.fromMap(element);
          int price = item.price ?? 0;
          int quantity = item.quantity ?? 0;
          int total = price * quantity;
          sub += total;
        }

        emit(CartLoadedState(
          items: products.map((e) => CartItem.fromMap(e)).toList(),
          total: sub,
        ));
      }
    } catch (e) {
      emit(CartEmptyState());
    }
  }
}
