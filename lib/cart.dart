import 'package:FlutterStateManagementDemo/model/CartModel.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Consumer<CartModel>(builder: (context, cart, child) {
        return ListView.separated(
          itemCount: cart.selectedProducts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                cart.selectedProducts[index].name,
                style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
              ),
              leading: Icon(Icons.account_circle),
              trailing: IconButton(
                icon: Icon(Icons.remove_shopping_cart),
                onPressed: () {
                  // onProductTap(index);
                  cart.selectedProducts.remove(cart.selectedProducts[index]);
                },
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
        );
      }),
    );
  }
}
