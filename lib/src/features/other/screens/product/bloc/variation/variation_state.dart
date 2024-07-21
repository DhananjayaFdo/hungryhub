part of 'variation_bloc.dart';

sealed class VariationState {
  List<UnitTypesEntity> type;
  bool isUnitsAvailable;

  VariationState({required this.type, required this.isUnitsAvailable});
}

final class VariationInitial extends VariationState {
  VariationInitial({required super.type, required super.isUnitsAvailable});
}
