import 'package:flutter/material.dart';

import '../Product.dart';

class CartModel extends ChangeNotifier {
  List<Product> _selectedProducts = [];

  List<Product> get selectedProducts => _selectedProducts;

  void add(Product product) {
    _selectedProducts.add(product);

    notifyListeners();
  }
}
