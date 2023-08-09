import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.imageUrl});
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Product 1',
      description: 'Description for Product 1',
      price: 19.99,
      imageUrl: 'assets/images/product1.png',
    ),
    Product(
      name: 'Product 2',
      description: 'Description for Product 2',
      price: 29.99,
      imageUrl: 'assets/images/product2.png',
    ),
    // Add more products as needed
  ];

  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  Future<void> addProductToFirebase(Product product) {
    return productsCollection
        .add({
          'name': product.name,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
        })
        .then((value) => print('Product added to Firestore'))
        .catchError((error) => print('Failed to add product: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of grid columns
          childAspectRatio: 0.7, // Width to height ratio of each grid item
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              addProductToFirebase(products[index]);
              // You can handle additional actions when the product is clicked,
              // such as displaying a success message or navigating to a different screen.
            },
            child: Card(
              child: Column(
                children: [
                  Image.network(
                    products[index].imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  ListTile(
                    title: Text(products[index].name),
                    subtitle: Text(products[index].description),
                    trailing:
                        Text('\$${products[index].price.toStringAsFixed(2)}'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProductListScreen(),
  ));
}
