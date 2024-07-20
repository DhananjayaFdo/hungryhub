import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';

class CartBtn extends StatelessWidget {
  const CartBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: AppTheme.white,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30, top: 10),
            child: SafeArea(
              top: false,
              child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Add to cart',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppTheme.white,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
