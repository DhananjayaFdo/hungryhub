import 'package:flutter/cupertino.dart';
import 'package:hungyhub/src/features/other/domain/entity/category.dart';
import 'package:hungyhub/src/features/other/domain/entity/product.dart';
import 'package:hungyhub/src/features/other/screens/screens.dart';

import '../../features/splash/screens/screens.dart';

class AppRoutes {
  static const String splash = "/";
  static const String home = "home";
  static const String cart = "cart";
  static const String category = "category";
  static const String product = "product";
  static const String search = "search";
  static const String message = "message";

  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return NavStyles.nav1(const SplashScreen());
      case home:
        return NavStyles.nav1(const HomeScreen());
      case cart:
        return NavStyles.nav1(const CartScreen());
      case category:
        CategoryEntity category = settings.arguments as CategoryEntity;
        return NavStyles.nav1(CategoryScreen(category: category));
      case product:
        ProductEntity product = settings.arguments as ProductEntity;
        return NavStyles.nav1(ProductsScreen(product: product));
      case search:
        return NavStyles.nav1(const SearchScreen());
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
