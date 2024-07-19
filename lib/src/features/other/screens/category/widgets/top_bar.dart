import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/core/widgets/widgets.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      color: AppTheme.white,
      child: const SafeArea(
        bottom: false,
        child: Row(
          children: [
            //? --------
            NavBarBackBtn(),

            //? --------
            Title(),

            //? --------
            SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          'Desert',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
        ),
      ),
    );
  }
}
