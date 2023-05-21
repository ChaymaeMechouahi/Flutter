import 'package:flutter_hello/modules/edition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiEdition {
  List<Edition> editions = [];
  Future<List<Edition>> editionsGet() async {
    http.Response response = await http.get(Uri.parse(
        "http://localhost:3005/editions")); // Obtenir les données de mon API
    
    var body = jsonDecode(response.body);
    for (var item in body) {
      editions.add(Edition.fromJson(item));
    }

    return editions;
  }
}
