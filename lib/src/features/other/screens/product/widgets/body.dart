import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/features/other/screens/product/widgets.dart';

import '../../../domain/entity/product.dart';
import '../bloc/product_bloc.dart';

class Body extends StatefulWidget {
  final ProductEntity product;

  const Body({super.key, required this.product});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();

    //? -----
    context.read<ProductBloc>().add(
          CartInitialUnitTypeSetEvent(
            unitType: widget.product.unitType != null ? widget.product.unitType![0] : null,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: CustomScrollView(
        slivers: [
          CusSliverAppBar(product: widget.product),
          ProductDetailsView(product: widget.product),
        ],
      ),
    );
  }
}
