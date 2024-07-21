import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/widgets/widgets.dart';
import 'package:hungyhub/src/features/other/domain/entity/category.dart';

class TopBar extends StatelessWidget {
  final CategoryEntity category;

  const TopBar({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      color: AppTheme.white,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            //? --------
            const NavBarBackBtn(),

            //? --------
            Title(category: category),

            //? --------
            const SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final CategoryEntity category;

  const Title({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          category.name ?? '',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
        ),
      ),
    );
  }
}
