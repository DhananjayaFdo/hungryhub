part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryActionState extends CategoryState {}

final class CategoryInitial extends CategoryState {}

//? category section ------
final class HomeCategoryLoadingState extends CategoryState {}

final class HomeCategoryLoadedState extends CategoryState {
  final List<CategoryEntity> categories;

  HomeCategoryLoadedState({required this.categories});
}

final class HomeCategoryEmptyState extends CategoryState {}

final class HomeCategoryErrorState extends CategoryState {}

final class HomeCategoryCardClickState extends CategoryActionState {}
