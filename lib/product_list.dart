import 'package:FlutterStateManagementDemo/model/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Product.dart';

class ProductList extends StatelessWidget {
  final products = List<Product>.generate(
      20,
      (index) => Product(
          "Product no $index", "This is the details of Product number $index"));

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            products[index].name,
            style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
          ),
          leading: Icon(Icons.account_circle),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              context.read<CartModel>().add(products[index]);

              // Provider.of<CartModel>(context, listen: false)
              //     .add(products[index]);

              SnackBar s = SnackBar(
                content: Text("Product No $index added to cart"),
                duration: Duration(milliseconds: 300),
              );
              Scaffold.of(context).showSnackBar(s);
            },
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }
}
