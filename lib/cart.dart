import 'package:flutter/material.dart';

import 'Product.dart';

class Cart extends StatelessWidget {
  final List<Product> cartProducts;

  Cart(this.cartProducts, {Product data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.separated(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              cartProducts[index].name,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
            ),
            leading: Icon(Icons.account_circle),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                // onProductTap(index);
                cartProducts.remove(cartProducts[index]);
              },
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
