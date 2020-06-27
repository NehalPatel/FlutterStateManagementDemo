import 'package:flutter/material.dart';

import 'Product.dart';
import 'product_list.dart';

class HomePage extends StatelessWidget {
  final products = List<Product>.generate(
      20,
      (index) => Product(
          "Product no $index", "This is the details of Product number $index"));

  final List<Product> selectedProducts = List<Product>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Application"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/cart', arguments: selectedProducts);
            },
          ),
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return ProductList(
          products: products,
          onProductTap: (index) {
            selectedProducts.add(products[index]);
            SnackBar s = SnackBar(
              content: Text("Product $index added to cart"),
              duration: Duration(milliseconds: 300),
            );
            Scaffold.of(context).showSnackBar(s);
          },
        );
      }),
    );
  }
}
