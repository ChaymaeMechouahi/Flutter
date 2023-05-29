import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modules/image.dart';

class APIManager {
  static const String baseURL = 'http://192.168.1.112:3005';

  static Future<http.Response> fetchData(String endpoint) async {
    var url = Uri.parse('$baseURL/$endpoint');
    var response = await http.get(url);
    print('connexion reçu');
    return response;
  }
}

Future<List<Imge>> fetchImagesFromAPI(List<int> nums, List<int> ids) async {
  final url = 'http://192.168.1.112:3005/images';

  final List<Imge> images = [];

  for (int i = 0; i < nums.length; i++) {
    final num = nums[i];
    final id = ids[i];

    final response = await http.get(Uri.parse('$url/$num/$id'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final image = Imge.fromJson(jsonData);
      images.add(image);
    } else {
      throw Exception(
          'Erreur lors de la récupération des données depuis l\'API.');
    }
  }

  return images;
}
