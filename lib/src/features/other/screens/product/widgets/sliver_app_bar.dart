import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';

import '../../../domain/entity/product.dart';

class CusSliverAppBar extends StatelessWidget {
  final ProductEntity product;

  const CusSliverAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      leading: const BackBtn(),
      flexibleSpace: AppBarBottom(product: product),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: AppTheme.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppTheme.BLUE,
            size: 25,
          ),
        ),
      ),
    );
  }
}

class AppBarBottom extends StatefulWidget {
  final ProductEntity product;

  const AppBarBottom({super.key, required this.product});

  @override
  State<AppBarBottom> createState() => _AppBarBottomState();
}

class _AppBarBottomState extends State<AppBarBottom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: widget.product.image ?? '',
        imageBuilder: (context, imageProvider) => Ink.image(image: imageProvider, fit: BoxFit.cover),
        errorWidget: (context, url, error) => const Icon(Icons.fastfood_outlined, color: AppTheme.white),
      ),
    );
  }
}
