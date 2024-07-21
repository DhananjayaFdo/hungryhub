import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/network/error/erro.dart';
import '../../../../../../core/network/success/success.dart';
import '../../../../../../core/services/sqflite/db_helper.dart';
import '../../../../../../core/widgets/cus_widgets.dart';
import '../../../../data/repository/order_data_source_impl.dart';
import '../../../../data/source/remote/order_remote.dart';
import '../../../../domain/usecase/order.dart';
import '../cart/cart_bloc.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<CartPlaceOrderBtnClickEvent>(cartPlaceOrderBtnClickEvent);
  }

  FutureOr<void> cartPlaceOrderBtnClickEvent(CartPlaceOrderBtnClickEvent event, Emitter<OrderState> emit) async {
    final dbHelper = DatabaseHelper.instance;

    List<Map<String, dynamic>> products = await dbHelper.readData(table: DatabaseHelper.table);

    if (products.length > 1) {
      flutterToast('Only one item can be ordered at a time');
    } else if (products.isEmpty) {
      flutterToast('cart isEmpty');
    } else {
      emit(OrderPlaceOrderLoadingState());

      Map<String, dynamic> product = products.first;

      Map<String, dynamic> data = {
        "Id": "1234566443",
        "name": "Sandwich",
        "price": 90000,
      };

      Either<ErrorResponse, SuccessResponse<bool>> success = await OrderUseCase(
        repository: OrderDataSourceImpl(
          source: OrderRemoteDataSource(
            dio: Dio(),
          ),
        ),
      ).store(data);

      success.fold((l) {
        emit(OrderPlaceOrderFailedState());
      }, (r) {
        dbHelper.clearCart();

        emit(OrderPlaceOrderSuccessState());
      });

      emit(OrderPlaceOrderCompleteState());
    }
  }
}
