import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/utils/constants/app_dimensions.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const TitleWithFavorite(),
          const UnitsShower(),
          const PriceAndCounterShower(),
          const Description(),
        ],
      ),
    );
  }
}

class TitleWithFavorite extends StatelessWidget {
  const TitleWithFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 15,
        left: CusDimensions.defaultPaddingSize,
        right: CusDimensions.defaultPaddingSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Title(),
          FavoriteIcon(),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Chicken Pizza',
      style: Theme.of(context).textTheme.titleMedium!.copyWith(),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key});

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
  const UnitsShower({super.key});

  @override
  State<UnitsShower> createState() => _UnitsShowerState();
}

class _UnitsShowerState extends State<UnitsShower> {
  String selectedUnit = '';

  List units = ['s', 'm', 'l'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        bottom: 15,
        left: CusDimensions.defaultPaddingSize,
        right: CusDimensions.defaultPaddingSize,
      ),
      child: Wrap(
        children: [
          ...units
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => setState(() => selectedUnit = e),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: selectedUnit == e ? Theme.of(context).primaryColor : AppTheme.ASH,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        e.toString().toUpperCase(),
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: selectedUnit == e ? AppTheme.white : Theme.of(context).textTheme.titleMedium!.color,
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
}

class PriceAndCounterShower extends StatelessWidget {
  const PriceAndCounterShower({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: CusDimensions.defaultPaddingSize,
        right: CusDimensions.defaultPaddingSize,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Price(),
              Counter(),
            ],
          ),

          //? -------------
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Divider(color: Colors.black26, height: 1),
          ),
        ],
      ),
    );
  }
}

class Price extends StatelessWidget {
  const Price({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        "RS 500.00",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20,
            ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //? --------------
        CounterBtn(
          icons: Icons.remove,
          iconColor: Colors.black,
          backColor: AppTheme.ASH,
          onTap: () {},
        ),

        //? --------------
        const SizedBox(
          width: 60,
          child: Center(
            child: Text('10'),
          ),
        ),

        //? --------------
        CounterBtn(
          icons: Icons.add,
          iconColor: Colors.white,
          backColor: Theme.of(context).primaryColor,
          onTap: () {},
        ),
      ],
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
    return GestureDetector(
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
  const Description({super.key});

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
                  text: setLength(
                      "Labore exercitation adipisicing occaecat velit officia commodo occaecat laboris qui cupidatat veniam fugiat. Veniam laborum cillum anim ullamco qui non aliqua ad veniam velit adipisicing nostrud. Nostrud laborum do est dolore aliquip consequat id. Et ut do minim minim aliqua tempor amet est. Proident excepteur pariatur deserunt cillum velit aliqua incididunt voluptate laborum."),
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
