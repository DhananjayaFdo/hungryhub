import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/utils/constants/app_dimensions.dart';
import 'package:hungyhub/src/features/other/domain/entity/category.dart';
import 'package:hungyhub/src/features/other/screens/category/bloc/provider/category.dart';
import 'package:hungyhub/src/features/other/screens/category/category/category_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../domain/entity/product.dart';
import '../bloc/load_product/load_product_bloc.dart';

class ProductsView extends StatefulWidget {
  final CategoryEntity category;

  const ProductsView({super.key, required this.category});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final scrollController = ScrollController();

  checkScrollPosition() async {
    scrollController.addListener(() async {
      double currentPosition = scrollController.offset;
      double maxPosition = scrollController.position.maxScrollExtent;

      if (currentPosition == maxPosition) {
        int page = Provider.of<ProductByCategoryProvider>(context, listen: false).page;
        print(page);
        context.read<LoadProductBloc>().add(
              MoreProductLoadEvent(
                page: page + 1,
                context: context,
                categoryId: widget.category.id ?? '0',
              ),
            );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(CategoryInitialEvent(category: widget.category, context: context));
    checkScrollPosition();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              color: AppTheme.white,
              child: (() {
                switch (state.runtimeType) {
                  case ProductByCategoryLoadingState:
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );

                  case ProductByCategoryLoadedState:
                    // var data = state as ProductByCategoryLoadedState;

                    ProductByCategoryProvider pro = Provider.of<ProductByCategoryProvider>(context);
                    List<ProductEntity> products = pro.products;
                    return ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.only(bottom: 20, top: 15),
                      itemCount: products.length + 1,
                      itemBuilder: (context, index) {
                        if (index == products.length) {
                          return BlocConsumer<LoadProductBloc, LoadProductState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              switch (state.runtimeType) {
                                case LoadProductLoadingState:
                                  return Container(
                                    height: 30,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: const Text('Loading......'),
                                  );

                                case LoadProductLoadedState:
                                  return const SizedBox();

                                case LoadProductErrorState:
                                  return const SizedBox();

                                case LoadProductEmptyState:
                                  return Container(
                                    height: 30,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    child: const Text('No More Product Available'),
                                  );

                                default:
                                  return const SizedBox();
                              }
                            },
                          );
                        }

                        return ProductCard(product: products[index]);
                      },
                    );

                  case ProductByCategoryEmptyState:
                    return SizedBox();

                  case ProductByCategoryErrorState:
                    return SizedBox();

                  default:
                    return SizedBox();
                }
              }()),
            ),
          ),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: CusDimensions.defaultPaddingSize,
        right: CusDimensions.defaultPaddingSize,
        bottom: 20,
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(AppRoutes.product, arguments: product),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProductImage(avatar: product.image ?? ''),

              //? ------------
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FavoriteIcon(),
                      Title2(title: product.name ?? ''),
                      Description(description: product.description ?? ''),
                      PriceWithTypeRow(product: product),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String avatar;

  const ProductImage({super.key, required this.avatar});

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
        child: CachedNetworkImage(
          imageUrl: avatar,
          imageBuilder: (context, imageProvider) => Image(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.fastfood_outlined, color: AppTheme.white),
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
  final String title;

  const Title2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String description;

  const Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        description,
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
  final ProductEntity product;

  const PriceWithTypeRow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Type(product: product),
          Price(product: product),
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
    return Text(
      "Rs ${product.price}.00",
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}

class Type extends StatelessWidget {
  final ProductEntity product;

  const Type({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Text(
      product.categoryName ?? '',
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
