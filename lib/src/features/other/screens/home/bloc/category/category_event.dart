part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

final class CategoryInitialEvent extends CategoryEvent {}

final class CategoryCardCLickEvent extends CategoryEvent {
  final CategoryEntity category;

  CategoryCardCLickEvent({required this.category});
}
