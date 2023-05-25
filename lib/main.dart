import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/controllers/connexion.dart';
import 'package:http/http.dart' as http;
import 'modules/edition.dart';
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
      title: 'Mon application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


