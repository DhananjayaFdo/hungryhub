import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';

class CusSliverAppBar extends StatelessWidget {
  const CusSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const BackBtn(),
      bottom: const AppBarBottom(),
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

class AppBarBottom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarBottom({super.key});

  @override
  State<AppBarBottom> createState() => _AppBarBottomState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 200);
}

class _AppBarBottomState extends State<AppBarBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}
