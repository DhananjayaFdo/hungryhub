import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/features/other/domain/entity/db/product.dart';
import 'package:hungyhub/src/features/other/domain/entity/product.dart';
import 'package:hungyhub/src/features/other/screens/product/bloc/product_bloc.dart';

class CartBtn extends StatelessWidget {
  final ProductEntity product;

  const CartBtn({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listenWhen: (previous, current) => current is ProductActionState,
      buildWhen: (previous, current) => current is! ProductActionState,
      listener: (context, state) {
        if (state is CartItemAddToCartSuccessState) {}

        if (state is CartItemAddToCartFailedState) {}
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: AppTheme.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30, top: 10),
                child: SafeArea(
                  top: false,
                  child: GestureDetector(
                    onTap: () {
                      Map<String, dynamic> item = CartItem(
                        id: product.id,
                        name: product.name,
                        price: product.price,
                        image: product.image,
                        quantity: 1,
                        unitType: 'm',
                      ).toMap();

                      context.read<ProductBloc>().add(CartAddToCartBtnClickEvent(
                            cartItem: item,
                          ));
                    },
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
            ),
          ],
        );
      },
    );
  }
}
