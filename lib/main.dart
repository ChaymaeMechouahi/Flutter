import 'dart:convert';
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

class MyApp extends StatelessWidget {
  ApiEdition edition = ApiEdition();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editions App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Editions App'),
        ),
        body: FutureBuilder(
          future: edition.editionsGet(),
          builder: (context, snapshot) {
            List<Edition>? eds = snapshot.data as List<Edition>?;
            if (eds == null) {
              return CircularProgressIndicator(); // ou un widget de chargement approprié
            } else {
              return ListView.builder(
                itemCount: eds.length,
                itemBuilder: (context, index) {
                  return Text(eds[index].titre);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
