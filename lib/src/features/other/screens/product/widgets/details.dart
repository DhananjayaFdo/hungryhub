import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/utils/constants/app_dimensions.dart';
import 'package:hungyhub/src/features/other/domain/entity/product.dart';
import 'package:hungyhub/src/features/other/domain/entity/unit_type.dart';
import 'package:hungyhub/src/features/other/screens/product/bloc/counter/counter_bloc.dart';
import 'package:hungyhub/src/features/other/screens/product/bloc/product_bloc.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          TitleWithFavorite(product: widget.product),
          UnitsShower(product: widget.product),
          PriceAndCounterShower(product: widget.product),
          Description(product: widget.product),
        ],
      ),
    );
  }
}

class TitleWithFavorite extends StatelessWidget {
  final ProductEntity product;

  const TitleWithFavorite({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: CusDimensions.defaultPaddingSize,
        right: CusDimensions.defaultPaddingSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Title(product: product),
          FavoriteIcon(product: product),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final ProductEntity product;

  const Title({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Text(
      product.name ?? '',
      style: Theme.of(context).textTheme.titleMedium!.copyWith(),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  final ProductEntity product;

  const FavoriteIcon({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      child: Icon(
        Icons.favorite,
        size: 18,
        color: AppTheme.white.withOpacity(0.4),
      ),
    );
  }
}

class UnitsShower extends StatefulWidget {
  final ProductEntity product;

  const UnitsShower({super.key, required this.product});

  @override
  State<UnitsShower> createState() => _UnitsShowerState();
}

class _UnitsShowerState extends State<UnitsShower> {
  String selectedUnit = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          //? ----------------------
          case SelectedUnitTypeState:
            var success = state as SelectedUnitTypeState;
            UnitTypesEntity? unite = success.unitTypes;

            if (unite == null) {
              return const SizedBox();
            } else {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  bottom: 15,
                  left: CusDimensions.defaultPaddingSize,
                  right: CusDimensions.defaultPaddingSize,
                ),
                child: Wrap(
                  children: [
                    ...widget.product.unitType!
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () => context.read<ProductBloc>().add(
                                    CartUnitTypeChangeEvent(unitType: e),
                                  ),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: selectedUnit == e.value ? Theme.of(context).primaryColor : AppTheme.ASH,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  e.value![0].toString().toUpperCase(),
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        color: selectedUnit == e.value ? AppTheme.white : Theme.of(context).textTheme.titleMedium!.color,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              );
            }

          //? ----------------------
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class PriceAndCounterShower extends StatelessWidget {
  final ProductEntity product;

  const PriceAndCounterShower({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: CusDimensions.defaultPaddingSize,
        right: CusDimensions.defaultPaddingSize,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Price(product: product),
              Counter(product: product),
            ],
          ),

          //? -------------
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Divider(color: Colors.black26, height: 1),
          ),
        ],
      ),
    );
  }
}

class Price extends StatelessWidget {
  final ProductEntity product;

  const Price({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        "RS ${product.price}.00",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20,
            ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  final ProductEntity product;

  const Counter({super.key, required this.product});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Row(
          children: [
            //? --------------
            CounterBtn(
              icons: Icons.remove,
              iconColor: Colors.black,
              backColor: AppTheme.ASH,
              onTap: () => context.read<CounterBloc>().add(DecreaseItemEvent()),
            ),

            //? --------------
            SizedBox(
              width: 60,
              child: Center(
                child: Text("${state.count}"),
              ),
            ),

            //? --------------
            CounterBtn(
              icons: Icons.add,
              iconColor: Colors.white,
              backColor: Theme.of(context).primaryColor,
              // onTap: () => setState(() => count >= 10 ? null : count + 1),
              onTap: () => context.read<CounterBloc>().add(IncreaseItemEvent()),
            ),
          ],
        );
      },
    );
  }
}

class CounterBtn extends StatelessWidget {
  final IconData icons;
  final Color iconColor;
  final Color backColor;
  final void Function()? onTap;

  const CounterBtn({
    super.key,
    required this.icons,
    required this.iconColor,
    required this.backColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: backColor,
        ),
        child: Icon(
          icons,
          color: iconColor,
        ),
      ),
    );
  }
}

class Description extends StatefulWidget {
  final ProductEntity product;

  const Description({super.key, required this.product});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool isShowMore = false;

  setLength(String des) {
    if (des.length < 200) {
      return des;
    } else {
      if (isShowMore) {
        return des;
      } else {
        return "${des.substring(0, 200)}....";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: CusDimensions.defaultPaddingSize,
        right: CusDimensions.defaultPaddingSize,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Description',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(),
            ),
          ),

          //? -----------
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              children: [
                TextSpan(
                  text: setLength(widget.product.description ?? ''),
                ),

                //? ------
                TextSpan(
                  text: isShowMore ? " show less" : " show more",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                  recognizer: TapGestureRecognizer()..onTap = () => setState(() => isShowMore = !isShowMore),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
