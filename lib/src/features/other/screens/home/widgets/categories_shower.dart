import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/utils/constants/app_dimensions.dart';
import 'package:hungyhub/src/features/other/domain/entity/category.dart';
import 'package:hungyhub/src/features/other/screens/home/bloc/category/category_bloc.dart';

import '../../../../../config/routes/app_routes.dart';

class CategoriesShower extends StatefulWidget {
  const CategoriesShower({super.key});

  @override
  State<CategoriesShower> createState() => _CategoriesShowerState();
}

class _CategoriesShowerState extends State<CategoriesShower> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(CategoryInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listenWhen: (previous, current) => current is CategoryActionState,
      buildWhen: (previous, current) => current is! CategoryActionState,
      listener: (context, state) {
        if (state is HomeCategoryCardClickState) {
          Navigator.of(context).pushNamed(AppRoutes.category);
        }
      },
      builder: (context, state) {
        return Container(
          color: AppTheme.white,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? --------
              const Title(),

              (() {
                switch (state.runtimeType) {
                  //? --------
                  case HomeCategoryLoadingState:
                    return Padding(
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
                          itemBuilder: (context, index) => const CategoryLoadingCard(),
                        ),
                      ),
                    );

                  //? --------
                  case HomeCategoryLoadedState:
                    var categories = state as HomeCategoryLoadedState;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 40,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(
                            left: CusDimensions.defaultPaddingSize,
                            right: CusDimensions.defaultPaddingSize,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.categories.length,
                          itemBuilder: (context, index) => CategoryCard(category: categories.categories[index]),
                        ),
                      ),
                    );

                  //? --------
                  case HomeCategoryEmptyState:
                    return const SizedBox();

                  //? --------
                  case HomeCategoryErrorState:
                    return const SizedBox();

                  //? --------
                  default:
                    return const SizedBox();
                }
              }()),
            ],
          ),
        );
      },
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
  final CategoryEntity category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          context.read<CategoryBloc>().add(CategoryCardCLickEvent());
        },
        // onTap: () => BlocProvider.of<CategoryBloc>(context).add(CategoryCardCLickEvent()),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).primaryColor,
          ),
          child: Row(
            children: [
              // const Icon(Icons.ac_unit, size: 20, color: AppTheme.white),
              //? ----------
              SizedBox(
                height: 20,
                width: 20,
                child: CachedNetworkImage(
                  imageUrl: category.image ?? '',
                  imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                  errorWidget: (context, url, error) => const Icon(Icons.fastfood, color: AppTheme.white, size: 20),
                ),
              ),
              spacerHor(5),
              Text(
                category.name ?? '',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppTheme.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryLoadingCard extends StatelessWidget {
  const CategoryLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
      ),
    );
  }
}
