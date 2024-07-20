import 'package:flutter/cupertino.dart';
import 'package:hungyhub/src/features/other/screens/screens.dart';

import '../../features/splash/screens/screens.dart';

class AppRoutes {
  static const String splash = "/";
  static const String home = "home";
  static const String cart = "cart";
  static const String category = "category";
  static const String product = "product";

  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return NavStyles.nav1(const SplashScreen());
      case home:
        return NavStyles.nav1(const HomeScreen());
      case cart:
        return NavStyles.nav1(const CartScreen());
      case category:
        return NavStyles.nav1(const CategoryScreen());
      case product:
        return NavStyles.nav1(const ProductsScreen());
      default:
        return NavStyles.nav1(const HomeScreen());
    }
  }
}

class NavStyles {
  static nav1(Widget scree) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => scree,
    );
  }
}
