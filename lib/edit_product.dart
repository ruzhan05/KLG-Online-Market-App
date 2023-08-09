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
            title: Text('Edit Product'),
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text('Tropicana Apple', style: TextStyle(color: Colors.purple, fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                SizedBox(
                  height: 200,
                  width: 500,
                  child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image(image: AssetImage('assets/images/tropicana.png'))),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 280,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, side: BorderSide.none, shape: const StadiumBorder()),
                  child: Wrap(
                      children: <Widget>[
                      Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 24.0,
                      ),
                      SizedBox(
                          width:10,
                      ),
                      Text("Change Product Image", style:TextStyle(fontSize:20)),
                      ],),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    style: TextStyle(color: Colors.purple),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Tropicana Apple',
                      labelStyle: TextStyle(
                        color: Colors
                            .purple, // Set the desired color for the label
                      ),
                      hintText: 'New Product Name',
                      prefixIcon: Icon(
                        Icons.tag,
                        color: Colors.purple,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    onChanged: (String Value) {},
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    maxLines: 8,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(color: Colors.purple),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in diam in ligula ultricies varius.',
                      labelStyle: TextStyle(
                        color: Colors.purple, // Set the desired color for the label
                      ),
                      hintText: 'New Product Description',
                      prefixIcon: Icon(
                        Icons.description_outlined,
                        color: Colors.purple,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    onChanged: (String Value) {},
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.purple),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "RM 3.55",
                      labelStyle: TextStyle(
                        color: Colors.purple, // Set the desired color for the label
                      ),
                      hintText: "New Product Price",
                      prefixIcon: Icon(
                        Icons.price_change,
                        color: Colors.purple,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    onChanged: (String Value) {},
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, side: BorderSide.none, shape: const StadiumBorder()),
                  child: const Text('Update Product'),
                  ),
                ),
                Divider()
              ],
            ),
          )),
    );
  }
}
