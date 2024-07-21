import 'package:flutter/material.dart';
import 'package:hungyhub/src/features/other/domain/entity/product.dart';

class ProductByCategoryProvider extends ChangeNotifier {
  int _page = 0;

  int get page => _page;

  List<ProductEntity> _products = [];

  List<ProductEntity> get products => _products;

  setPageAndProducts(int page, List<ProductEntity> products) {
    _page = page;
    _products = products;
    notifyListeners();
  }

  addProducts(int page, List<ProductEntity> products) {
    _page = page;
    _products.addAll(products);
    notifyListeners();
  }
}
