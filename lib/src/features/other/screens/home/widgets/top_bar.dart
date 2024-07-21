import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/features/other/domain/entity/db/product.dart';
import 'package:hungyhub/src/features/other/domain/entity/product.dart';
import 'package:hungyhub/src/features/other/screens/home/bloc/product/products_bloc.dart';
import 'package:hungyhub/src/features/other/screens/product/bloc/product_bloc.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/constants/app_dimensions.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: Container(
        color: AppTheme.white,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: widthUsingMQ(context, 0.04),
              right: widthUsingMQ(context, 0.04),
              bottom: 10,
            ),
            child: const Row(
              children: [
                CartIcon(),
                SearchBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.cart),
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: const SizedBox(
        height: 50,
        width: 50,
        child: Icon(Icons.shopping_cart_outlined, size: 30),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Expanded(
          child: GestureDetector(
            // onTap: () => Navigator.of(context).pushNamed(AppRoutes.search),
            onTap: () {
              showSearch(context: context, delegate: CustomSearch(items: []));

              // print(state.runtimeType);
              // switch (state.runtimeType) {
              //   case HomeProductsLoadedState:
              //     var suc = state as HomeProductsLoadedState;
              //     showSearch(context: context, delegate: CustomSearch(items: suc.products));
              //     break;
              //   default:
              //     return;
              // }
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppTheme.ASH,
              ),
              child: Row(
                children: [
                  //? -----------------------
                  const Icon(Icons.search),

                  //? -----------------------
                  spacerHor(10),

                  //? -----------------------
                  Text(
                    'Search',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.5),
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<ProductEntity> items;

  CustomSearch({required this.items});

  // List<String> fruitList = [
  //   'Apple',
  //   'Banana',
  //   'Peach',
  //   'Avocado',
  //   'Orange',
  //   'Pear',
  //   'Watermelon',
  //   'pineapple',
  // ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var item in items) {
      if (item.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.name!);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var item in items) {
      if (item.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.name!);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchQuery[index]),
        );
      },
    );
  }
}
