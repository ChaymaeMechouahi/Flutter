import 'package:flutter_hello/modules/edition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIManager {
  static const String baseURL = 'http://localhost:3005';

   static Future<http.Response> fetchData(String endpoint) async {
    var url = Uri.parse('$baseURL/$endpoint');
    var response = await http.get(url);
    print('connexion reçu');
    return response;
  }
}
