part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartActionState extends CartState {}

final class CartInitial extends CartState {}

//? --------------
final class CartLoadingState extends CartState {}

final class CartLoadedState extends CartState {
  final List<CartItem> items;
  final int total;

  CartLoadedState({required this.items, required this.total});
}

final class CartEmptyState extends CartState {}

final class CartErrorState extends CartState {}
