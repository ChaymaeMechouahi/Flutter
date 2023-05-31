import 'dart:convert';

import 'package:http/http.dart' as http;



class APIManager {
  static const String baseURL = 'http://192.168.1.112:3005';

  static Future<http.Response> fetchData(String endpoint) async {
    var url = Uri.parse('$baseURL/$endpoint');
    var response = await http.get(url);
    print('Connexion reçue depuis l\'API : $response');
    return response;
  }

 static Future<List<String>> fetchImageUrlsFromAPI(List<int> nums, List<int> ids) async {
  final List<String> imageUrls = [];

  for (int i = 0; i < nums.length; i++) {
    final num = nums[i];
    final id = ids[i];
    final endpoint = '/images/$num/$id';

    final response = await fetchData(endpoint);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final base64Image = jsonData['img'];
      final decodedImage = utf8.decode(base64.decode(base64Image));
      imageUrls.add(decodedImage);
    } else {
      throw Exception('Erreur lors de la récupération des données depuis l\'API.');
    }
  }

  print('Décodage Fini');
  return imageUrls;
}


}
