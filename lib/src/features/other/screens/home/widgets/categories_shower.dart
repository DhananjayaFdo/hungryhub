import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/utils/constants/app_dimensions.dart';

class CategoriesShower extends StatelessWidget {
  const CategoriesShower({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //? --------
          const Title(),

          //? --------
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  left: CusDimensions.defaultPaddingSize,
                  right: CusDimensions.defaultPaddingSize,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => CategoryCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: CusDimensions.defaultPaddingSize,
        right: CusDimensions.defaultPaddingSize,
      ),
      child: Text(
        'Category',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).primaryColor,
        ),
        child: Row(
          children: [
            const Icon(Icons.ac_unit, size: 20, color: AppTheme.white),
            spacerHor(5),
            Text(
              'Main Dish',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppTheme.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
