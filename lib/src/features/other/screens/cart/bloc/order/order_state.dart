part of 'order_bloc.dart';

@immutable
sealed class OrderState {}

final class OrderActionState extends OrderState {}

final class OrderInitial extends OrderState {}

//? --------------
final class OrderPlaceOrderClickState extends OrderActionState {}

final class OrderPlaceOrderLoadingState extends OrderState {}

final class OrderPlaceOrderSuccessState extends OrderActionState {}

final class OrderPlaceOrderFailedState extends OrderActionState {}

final class OrderPlaceOrderCompleteState extends OrderState {}
