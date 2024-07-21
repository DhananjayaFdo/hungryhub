part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class CartCountBtnClickEvent extends ProductEvent {}

// unit type -----------
final class CartInitialUnitTypeSetEvent extends ProductEvent {
  final UnitTypesEntity? unitType;

  CartInitialUnitTypeSetEvent({this.unitType});
}

final class CartUnitTypeChangeEvent extends ProductEvent {
  final UnitTypesEntity unitType;

  CartUnitTypeChangeEvent({required this.unitType});
}

final class CartAddToCartBtnClickEvent extends ProductEvent {
  final Map<String, dynamic> cartItem;

  CartAddToCartBtnClickEvent({required this.cartItem});
}
