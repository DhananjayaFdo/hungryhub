part of 'load_product_bloc.dart';

@immutable
sealed class LoadProductState {}

final class LoadProductInitial extends LoadProductState {}

final class LoadProductLoadingState extends LoadProductState {}

final class LoadProductLoadedState extends LoadProductState {}

final class LoadProductEmptyState extends LoadProductState {}

final class LoadProductErrorState extends LoadProductState {}
