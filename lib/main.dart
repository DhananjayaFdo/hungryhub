import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hungyhub/src/config/theme/app_theme.dart';
import 'package:hungyhub/src/features/other/screens/category/bloc/provider/category.dart';
import 'package:hungyhub/src/features/other/screens/home/bloc/provider/products.dart';
import 'package:hungyhub/src/features/other/screens/home/provider/search.dart';
import 'package:hungyhub/src/features/other/screens/product/provider/unit_type.dart';
import 'package:provider/provider.dart';

import 'src/config/routes/app_routes.dart';
import 'src/core/services/sqflite/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //? initialize database ----
  final dbHelper = DatabaseHelper.instance;
  await dbHelper.database;

  await dotenv.load(fileName: ".env");

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => UnitTypeProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ProductByCategoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        onGenerateRoute: AppRoutes.generatedRoute,
      ),
    );
  }
}
