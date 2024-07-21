import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/features/other/screens/cart/bloc/cart/cart_bloc.dart';
import 'package:hungyhub/src/features/other/screens/cart/bloc/order/order_bloc.dart';

import 'widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => OrderBloc()),
      ],
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            TopBar(),
            Body(),
          ],
        ),
        bottomNavigationBar: PlaceOrderSection(),
      ),
    );
  }
}
