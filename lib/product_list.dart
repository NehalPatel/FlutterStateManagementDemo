import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final products;
  final ValueSetter<int> onProductTap;

  const ProductList({Key key, this.products, this.onProductTap})
      : super(key: key);

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
              onProductTap(index);
            },
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }
}
