import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/features/other/domain/entity/product.dart';
import 'package:hungyhub/src/features/other/screens/product/bloc/counter/counter_bloc.dart';
import 'package:hungyhub/src/features/other/screens/product/bloc/product_bloc.dart';
import 'package:hungyhub/src/features/other/screens/product/bloc/variation/variation_bloc.dart';
import 'package:hungyhub/src/features/other/screens/product/provider/unit_type.dart';
import 'package:hungyhub/src/features/other/screens/product/widgets.dart';

class ProductsScreen extends StatefulWidget {
  final ProductEntity product;

  const ProductsScreen({super.key, required this.product});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => VariationBloc()),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Body(product: widget.product),
        bottomNavigationBar: CartBtn(product: widget.product),
      ),
    );
  }
}
