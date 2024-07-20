import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';

import '../../../../../core/widgets/widgets.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: const SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 20,
            left: 10,
            right: 10,
          ),
          child: Row(
            children: [
              NavBarBackBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
