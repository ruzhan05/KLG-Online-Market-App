import 'package:flutter/material.dart';
// import 'package:flutter_app/home_page.dart';

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
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          appBar: AppBar(
            title: Text('Login Page'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.purple),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors
                                .purple, // Set the desired color for the label
                          ),
                          hintText: 'Enter email',
                          prefixIcon: Icon(
                            Icons.email,
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
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: Colors.purple),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors
                                .purple, // Set the desired color for the label
                          ),
                          hintText: 'Enter password',
                          prefixIcon: Icon(
                            Icons.lock,
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
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: MaterialButton(
                          minWidth: double.maxFinite,
                          height: 50,
                          onPressed: () {},
                          child: Text('Login'),
                          color: Colors.purple,
                          textColor: Colors.white,
                        )),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
