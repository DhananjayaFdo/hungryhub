import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/features/other/screens/product/widgets.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: const CustomScrollView(
        slivers: [
          CusSliverAppBar(),
          ProductDetailsView(),
        ],
      ),
    );
  }
}
