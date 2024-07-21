part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryActionState extends CategoryState {}

final class CategoryInitial extends CategoryState {}

final class ProductByCategoryLoadingState extends CategoryState {}

final class ProductByCategoryLoadedState extends CategoryState {
  final List<ProductEntity> product;

  ProductByCategoryLoadedState({required this.product});
}

final class ProductByCategoryErrorState extends CategoryState {}

final class ProductByCategoryEmptyState extends CategoryState {}
