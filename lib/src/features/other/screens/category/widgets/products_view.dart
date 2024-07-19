import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/utils/constants/app_dimensions.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          color: AppTheme.white,
          child: Scrollbar(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20, top: 15),
              itemCount: 10,
              itemBuilder: (context, index) => const ProductCard(),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: CusDimensions.defaultPaddingSize,
        right: CusDimensions.defaultPaddingSize,
        bottom: 20,
      ),
      child: Container(
        constraints: const BoxConstraints(minHeight: 120),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProductImage(),

            //? ------------
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FavoriteIcon(),
                    Title2(),
                    Description(),
                    PriceWithTypeRow(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: widthUsingMQ(context, 0.25),
        width: widthUsingMQ(context, 0.25),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Icon(
        Icons.favorite_border,
        color: Theme.of(context).primaryColor,
        size: 25,
      ),
    );
  }
}

class Title2 extends StatelessWidget {
  const Title2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        'Chicken Club Sandwich',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        'Duis proident labore aliquip eiusmod proident exercitation nulla esseasjdkjaskdj aksjd klasjd kal sdj sa',
        maxLines: 2,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              overflow: TextOverflow.ellipsis,
              fontSize: 11,
            ),
      ),
    );
  }
}

class PriceWithTypeRow extends StatelessWidget {
  const PriceWithTypeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Type(),
          Price(),
        ],
      ),
    );
  }
}

class Price extends StatelessWidget {
  const Price({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Rs 600.00",
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}

class Type extends StatelessWidget {
  const Type({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Main Dish',
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
