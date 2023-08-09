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
      home: const Products(),
    );
  }
}

class Products extends StatelessWidget {
  const Products({super.key});
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
                icon: Icon(Icons.add),
              ),
            ],
          ),
          body: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 0.55, 
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: MaterialButton(
                        minWidth: 5,
                        height: 50,
                        onPressed: () {},
                        child: Icon(Icons.edit),
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                    )),
                  ),
                  Image.asset('assets/images/tropicana.png'),
                  ListTile(
                    title: Text('Tropicana'),
                    subtitle: Text('The best apple juice.'),
                    trailing: Text('RM 3.55'),
                  ),
                  MaterialButton(
                            minWidth: 175,
                            height: 40,
                            onPressed: () {},
                            child: Icon(Icons.delete),
                            color: Colors.red,
                            textColor: Colors.white,
                          ),
                ],
              ),
            ),
          );
        },
      ),
    ),);
  }
}
