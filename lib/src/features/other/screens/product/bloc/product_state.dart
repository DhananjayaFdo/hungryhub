part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductActionState extends ProductState {}

final class CartInitial extends ProductState {}

final class SelectedUnitTypeState extends ProductState {
  final UnitTypesEntity? unitTypes;

  SelectedUnitTypeState({this.unitTypes});
}

final class CartCountBtnClickState extends ProductActionState {
  final int count;

  CartCountBtnClickState({required this.count});
}

//? --------------
final class CartItemAddToCartSuccessState extends ProductActionState {}

final class CartItemAddToCartFailedState extends ProductActionState {}
