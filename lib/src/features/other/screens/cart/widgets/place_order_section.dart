import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/config/routes/app_routes.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/utils/constants/app_dimensions.dart';
import 'package:hungyhub/src/core/widgets/cus_widgets.dart';
import 'package:hungyhub/src/features/other/screens/cart/bloc/cart/cart_bloc.dart';

import '../bloc/order/order_bloc.dart';

class PlaceOrderSection extends StatefulWidget {
  const PlaceOrderSection({super.key});

  @override
  State<PlaceOrderSection> createState() => _PlaceOrderSectionState();
}

class _PlaceOrderSectionState extends State<PlaceOrderSection> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartLoadingState:
            return const SizedBox();

          case CartLoadedState:
            var success = state as CartLoadedState;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: AppTheme.white,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(CusDimensions.defaultPaddingSize),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Total(),
                              Count(total: success.total),
                            ],
                          ),

                          //?-------------
                          const PlaceOrderBtn(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );

          case CartEmptyState:
            return const SizedBox();

          case CartErrorState:
            return const SizedBox();

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class Total extends StatelessWidget {
  const Total({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Total: ');
  }
}

class Count extends StatelessWidget {
  final int total;

  const Count({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Rs $total.00',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
        ),
      ),
    );
  }
}

class PlaceOrderBtn extends StatelessWidget {
  const PlaceOrderBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listenWhen: (previous, current) => current is OrderActionState,
      buildWhen: (previous, current) => current is! OrderActionState,
      listener: (context, state) {
        if (state is OrderPlaceOrderSuccessState) {
          flutterToast('Order place successful');
          Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        } else if (state is OrderPlaceOrderFailedState) {
          flutterToast('Order place failed');
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: AppTheme.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 30, right: 30, top: 15),
                child: SafeArea(
                  top: false,
                  child: GestureDetector(
                    onTap: () => context.read<OrderBloc>().add(CartPlaceOrderBtnClickEvent()),
                    child: Container(
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).primaryColor,
                        ),
                        alignment: Alignment.center,
                        child: (() {
                          switch (state.runtimeType) {
                            //? -----------
                            case OrderPlaceOrderLoadingState:
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppTheme.white,
                                ),
                              );

                            //? -----------

                            default:
                              return Text(
                                'Place Order',
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: AppTheme.white,
                                    ),
                              );
                          }
                        }())),
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
