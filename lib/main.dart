import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'modules/edition.dart';
//import 'home.dart';
//import 'essai.dart';

//void main() => runApp(MyHomePage());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<List<Edition>> fetchEditions() async {
    final response =
        await http.get(Uri.parse('http://localhost:3005/editions'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((item) => Edition(
                numero: item['num'],
                titre: item['titre'],
                texte: item['texte'],
                dateDebut: item['dateD'],
                dateFin: item['dateF'],
              ))
          .toList();
    } else {
      throw Exception('Failed to fetch editions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editions App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Editions App'),
        ),
        body: FutureBuilder<List<Edition>>(
          future: fetchEditions(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Edition> editions = snapshot.data!;
              return ListView.builder(
                itemCount: editions.length,
                itemBuilder: (context, index) {
                  final Edition edition = editions[index];
                  return ListTile(
                    title: Text('Edition ${edition.numero}'),
                    subtitle: Text('${edition.dateDebut} - ${edition.dateFin}'),
                    onTap: () {
                      // Gérer l'action lorsqu'un élément est cliqué
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
