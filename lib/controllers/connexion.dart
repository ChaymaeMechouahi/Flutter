import 'package:flutter_hello/modules/edition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiEdition {
  Future<List<Edition>> editionsGet() async {
    http.Response response = await http.get(Uri.parse(
        "http://localhost:3005/editions")); // Obtenir les données de mon API
    List<Edition> editions = [];

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      for (var item in body) {
        editions.add(Edition.fromJson(item));
      }

      return editions;
    } else {
      throw Exception(
          'Failed to fetch editions'); // Lancer une exception en cas de problème avec la requête
    }
  }
}
