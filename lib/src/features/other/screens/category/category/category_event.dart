part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

final class CategoryInitialEvent extends CategoryEvent {
  final CategoryEntity category;
  final BuildContext context;

  CategoryInitialEvent({required this.category, required this.context});
}
