import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';

import 'src/config/routes/app_routes.dart';

void main() {
  runApp(const HungryHub());
}

class HungryHub extends StatefulWidget {
  const HungryHub({super.key});

  @override
  State<HungryHub> createState() => _HungryHubState();
}

class _HungryHubState extends State<HungryHub> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      onGenerateRoute: AppRoutes.generatedRoute,
    );
  }
}
