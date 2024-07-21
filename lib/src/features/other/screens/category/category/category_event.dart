part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

final class CategoryInitialEvent extends CategoryEvent {
  final CategoryEntity category;

  CategoryInitialEvent({required this.category});
}
