import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/features/other/domain/entity/category.dart';
import 'package:hungyhub/src/features/other/screens/category/category/category_bloc.dart';

import 'widgets.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryEntity category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(),
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
