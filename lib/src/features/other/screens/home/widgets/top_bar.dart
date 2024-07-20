import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/constants/app_dimensions.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(AppRoutes.search),
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
  }
}
