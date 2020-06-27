import 'package:FlutterStateManagementDemo/Product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final products = List<Product>.generate(
      20,
      (index) => Product(
          "Product no $index", "This is the details of Product number $index"));

  final List<Product> selectedProducts = List<Product>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Shopping Application"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                print('move to cart');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => Cart(selectedProducts)),
                // );
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
      ),
    );
  }
}

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

class Cart extends StatelessWidget {
  final List<Product> cartProducts;

  Cart(this.cartProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: Text("Product Name"),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text("Product Details"),
          ),
        ],
      ),
    );
  }
}
