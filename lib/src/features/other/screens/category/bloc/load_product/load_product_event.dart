part of 'load_product_bloc.dart';

sealed class LoadProductEvent {}

final class MoreProductLoadEvent extends LoadProductEvent {
  int page;
  String categoryId;
  BuildContext context;

  MoreProductLoadEvent({required this.page, required this.context, required this.categoryId});
}
