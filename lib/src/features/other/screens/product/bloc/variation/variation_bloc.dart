import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hungyhub/src/features/other/domain/entity/unit_type.dart';

part 'variation_event.dart';

part 'variation_state.dart';

class VariationBloc extends Bloc<VariationEvent, VariationState> {
  VariationBloc() : super(VariationInitial(type: [], isUnitsAvailable: false)) {
    on<ProductVariationSetEvent>(productVariationSetEvent);
  }

  FutureOr<void> productVariationSetEvent(ProductVariationSetEvent event, Emitter<VariationState> emit) {
    emit(VariationInitial(
      type: event.type,
      isUnitsAvailable: event.isUnitsAvailable,
    ));
  }
}
