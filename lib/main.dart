import 'package:flutter/material.dart';
//import 'home.dart';
//import 'essai.dart';
  import 'package:flutter_hello/views/homepage.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


