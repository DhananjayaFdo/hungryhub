import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/features/other/domain/entity/product.dart';
import 'package:hungyhub/src/features/other/screens/product/bloc/product_bloc.dart';
import 'package:hungyhub/src/features/other/screens/product/widgets.dart';

class ProductsScreen extends StatefulWidget {
  final ProductEntity product;

  const ProductsScreen({super.key, required this.product});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Body(product: widget.product),
        bottomNavigationBar: CartBtn(product: widget.product),
      ),
    );
  }
}
