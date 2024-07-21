part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartInitialEvent extends CartEvent {}

final class CartItemIncreaseDecreaseEvent extends CartEvent {
  final bool isIncrease;
  final String id;

  CartItemIncreaseDecreaseEvent({required this.isIncrease, required this.id});
}

final class CartItemRemoveClickEvent extends CartEvent {
  final String id;

  CartItemRemoveClickEvent({required this.id});
}
