part of 'load_product_bloc.dart';

sealed class LoadProductEvent {}

final class MoreProductLoadState extends LoadProductEvent {
  int page;
  BuildContext context;

  MoreProductLoadState({required this.page, required this.context});
}
