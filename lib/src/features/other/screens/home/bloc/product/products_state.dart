part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsActionState extends ProductsState {}

final class ProductsInitial extends ProductsState {}

//? products section ------
final class HomeProductsLoadingState extends ProductsState {}

final class HomeProductsLoadedState extends ProductsState {
  final List<ProductEntity> products;

  HomeProductsLoadedState({required this.products});
}

final class HomeProductsEmptyState extends ProductsState {}

final class HomeProductsErrorState extends ProductsState {}

final class HomeProductCardClickState extends ProductsActionState {}

final class HomeProductFavBtnClickState extends ProductsActionState {}
