import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/utils/constants/app_dimensions.dart';

class PlaceOrderSection extends StatefulWidget {
  const PlaceOrderSection({super.key});

  @override
  State<PlaceOrderSection> createState() => _PlaceOrderSectionState();
}

class _PlaceOrderSectionState extends State<PlaceOrderSection> {
  @override
  Widget build(BuildContext context) {
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
                      Total(),
                      Count(),
                    ],
                  ),

                  //?-------------
                  PlaceOrderBtn(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Total extends StatelessWidget {
  const Total({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Total: ');
  }
}

class Count extends StatelessWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'Rs1750.00',
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: AppTheme.white,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 30, right: 30, top: 15),
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
                  'Place Order',
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
