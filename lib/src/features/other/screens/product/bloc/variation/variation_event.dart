part of 'variation_bloc.dart';

sealed class VariationEvent {}

final class ProductVariationSetEvent extends VariationEvent {
  List<UnitTypesEntity> type;
  bool isUnitsAvailable;

  ProductVariationSetEvent({required this.type, required this.isUnitsAvailable});
}
