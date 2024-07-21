import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/features/other/domain/entity/unit_type.dart';
import 'package:hungyhub/src/features/other/screens/product/bloc/variation/variation_bloc.dart';
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
    setVariation();
  }

  void setVariation() {
    if (widget.product.unitType == null || widget.product.unitType!.isEmpty) {
      context.read<VariationBloc>().add(
            ProductVariationSetEvent(
              type: [],
              isUnitsAvailable: false,
            ),
          );
    } else {
      context.read<VariationBloc>().add(ProductVariationSetEvent(
            type: widget.product.unitType!,
            isUnitsAvailable: true,
          ));
    }
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
