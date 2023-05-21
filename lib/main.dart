import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/controllers/connexion.dart';
import 'package:http/http.dart' as http;
import 'modules/edition.dart';
//import 'home.dart';
//import 'essai.dart';

//void main() => runApp(MyHomePage());
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //ApiEdition edition = ApiEdition();
  List<Edition> eds = [];
  void fetchEditions() async {
    print('fetchEditions called');
    const url = 'http://localhost:3005/editions';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      eds = json.data;
    });
    print('done');
  }

  @override
  void initState() {
    super.initState();
    fetchEditions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editions App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Editions App'),
          ),
          body: ListView.builder(
              itemCount: eds.length,
              itemBuilder: (context, index) {
                final edition = eds[index];
                final titre = edition.getTitre;
                return ListTile(title: Text(titre));
              })),
    );
  }
}
