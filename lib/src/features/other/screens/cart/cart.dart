import 'package:flutter/material.dart';

import 'widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TopBar(),
          Body(),
        ],
      ),
      bottomNavigationBar: PlaceOrderSection(),
    );
  }
}
