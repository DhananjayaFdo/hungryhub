import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/features/other/screens/home/bloc/category/category_bloc.dart';
import 'package:hungyhub/src/features/other/screens/home/bloc/product/products_bloc.dart';

import 'widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => ProductsBloc()),
      ],
      child: const Scaffold(
        body: Column(
          children: [
            TopBar(),
            CategoriesShower(),
            ProductsView(),
          ],
        ),
      ),
    );
  }
}
