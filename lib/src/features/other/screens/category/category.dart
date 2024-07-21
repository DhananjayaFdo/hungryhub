import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/features/other/domain/entity/category.dart';
import 'package:hungyhub/src/features/other/screens/category/bloc/load_product/load_product_bloc.dart';
import 'package:hungyhub/src/features/other/screens/category/bloc/provider/category.dart';
import 'package:hungyhub/src/features/other/screens/category/category/category_bloc.dart';
import 'package:provider/provider.dart';

import 'widgets.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryEntity category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => LoadProductBloc()),
      ],
      child: Scaffold(
        body: Column(
          children: [
            TopBar(category: widget.category),
            ProductsView(category: widget.category),
          ],
        ),
      ),
    );
  }
}
