import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pasa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Product(),
    );
  }
}

class Product extends StatelessWidget {
  const Product({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          appBar: AppBar(
            title: Text('Your Products'),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.production_quantity_limits),
              ),
            ],
          ),
          body: Column(
        children: [
          Image.asset('assets/images/tropicana.png'),
          SizedBox(height: 16),
          ListTile(
            title: Text('Tropicana'),
            subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in diam in ligula ultricies varius.', textAlign: TextAlign.justify,),
            trailing: Text('RM 3.55', style: TextStyle(fontSize: 18),),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: MaterialButton(
              minWidth: double.maxFinite,
              height: 50,
              onPressed: () {},
              child: Text('Buy'),
              color: Colors.purple,
              textColor: Colors.white,
          )),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: MaterialButton(
              minWidth: double.maxFinite,
              height: 50,
              onPressed: () {},
              child: Text('Add To Cart'),
              color: Colors.deepPurple,
              textColor: Colors.white,
          )),
        ],
      ),
    ),);
  }
}
