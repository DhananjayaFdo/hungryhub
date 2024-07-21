part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class ProductInitialEvent extends ProductsEvent {
  int page;

  ProductInitialEvent({required this.page});
}

final class ProductLoadMoreProductEvent extends ProductsEvent {}

final class HomeProductLoadingEvent extends ProductsEvent {
  int page;
  bool isLoadMore;
  final BuildContext context;

  HomeProductLoadingEvent({this.page = 0, required this.isLoadMore, required this.context});
}
