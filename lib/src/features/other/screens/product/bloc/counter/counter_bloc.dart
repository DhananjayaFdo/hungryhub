import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(count: 0)) {
    on<IncreaseItemEvent>((event, emit) {
      if (state.count < 10) {
        emit(CounterInitial(count: state.count + 1));
      }
    });

    on<DecreaseItemEvent>((event, emit) {
      if (state.count > 0) {
        emit(CounterInitial(count: state.count - 1));
      }
    });
  }
}
