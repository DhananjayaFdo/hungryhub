import 'package:flutter/cupertino.dart';

import '../../../domain/entity/product.dart';

class SearchProvider extends ChangeNotifier {
  List<ProductEntity> _product = [];

  List<ProductEntity> get product => _product;

  void setProducts(List<ProductEntity> products) {
    _product = products;
    notifyListeners();
  }
}
