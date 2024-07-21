part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  int count;

  CounterState({required this.count});
}

final class CounterInitial extends CounterState {
  CounterInitial({required super.count});
}
