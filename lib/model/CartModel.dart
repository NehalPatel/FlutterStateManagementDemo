import 'package:flutter/material.dart';

import '../Product.dart';
import '../Product.dart';

class CartModel extends ChangeNotifier {
  List<Product> _selectedProducts = [];

  List<Product> get selectedProducts => _selectedProducts;

  void add(Product product) {
    print("adding product to cart");
    _selectedProducts.add(product);

    notifyListeners();
  }

  void remove(Product product) {
    print("removing product from cart");
    _selectedProducts.remove(product);

    notifyListeners();
  }
}
