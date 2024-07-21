part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class IncreaseItemEvent extends CounterEvent {}

final class DecreaseItemEvent extends CounterEvent {}
