import 'dart:convert';
import 'package:http/http.dart' as http;

class APIManager {
  static const String baseURL = 'http://192.168.1.112:3005';
//Fonction de récupération d'images de page d'acceuil
  static Future<List<String>> fetchImageData(
      List<int> nums, List<int> ids) async {
    List<String> imageUrls = [];

    for (var i = 0; i < nums.length; i++) {
      var num = nums[i];
      var id = ids[i];
      var endpoint = 'images/$num/$id';
      var url = Uri.parse('$baseURL/$endpoint');
      print(url);

      var response = await http.get(url);
      print('bonjour $response');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data is Map<String, dynamic>) {
          var encodedImage = data['img'];
          var decodedImage = base64.decode(encodedImage);
          var imageUrl = utf8.decode(decodedImage);
          if (imageUrl != null) {
            imageUrls.add(imageUrl);
          }
        } else if (data is Iterable) {
          for (var item in data) {
            var encodedImage = item['img'];
            var decodedImage = base64.decode(encodedImage);
            var imageUrl = utf8.decode(decodedImage);
            if (imageUrl != null) {
              imageUrls.add(imageUrl);
            }
          }
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to fetch image data');
      }
    }

    return imageUrls;
  }
//Fonction qui permet de récupérer les dates pour la page d'acceuil
  static Future<List<String>> fetchEditionDates(List<int> nums) async {
    List<String> dates = [];

    for (var num in nums) {
      var endpoint = 'editions/$num/dateD';
      var url = Uri.parse('$baseURL/$endpoint');

      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = response.body;
        dates.add(data);
      } else {
        throw Exception('Failed to fetch edition dates');
      }
    }

    return dates;
  }
//fonction pour récupérer la datde fin 
  static Future<String> fetchEditionDateF(int num) async {
    var endpoint = 'editions/$num/dateF';
    var url = Uri.parse('$baseURL/$endpoint');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var dateF = response.body;
      return dateF;
    } else {
      throw Exception('Failed to fetch edition dates');
    }
  }
//fonction pour récupérer le titre d'une édition

  static Future<String> fetchEditionTitre(int num) async {
    var endpoint = 'editions/$num/titre';
    var url = Uri.parse('$baseURL/$endpoint');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var titre = response.body;
      return titre;
    } else {
      throw Exception('Failed to fetch edition title');
    }
  }
  //fonction pour récupérer le texte d'une édition

    static Future<String> fetchEditionTexte(int num) async {
    var endpoint = 'editions/$num/texte';
    var url = Uri.parse('$baseURL/$endpoint');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var texte = response.body;
      return texte;
    } else {
      throw Exception('Failed to fetch edition title');
    }
  }
  //fonction pour récupérer les lien des images d'une édition
  static Future<List<String>> fetchImageUrlList(int editionNumber) async {
  List<String> imageUrls = [];

  var endpoint = 'images/$editionNumber';
  var url = Uri.parse('$baseURL/$endpoint');

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    if (data is List && data.length > 1) {
      for (var i = 1; i < data.length; i++) {
        var item = data[i];
        var encodedImage = item['img'];
        var decodedImage = base64.decode(encodedImage);
        var imageUrl = utf8.decode(decodedImage);
        if (imageUrl != null) {
          imageUrls.add(imageUrl);
        }
      }
    } else {
      throw Exception('Invalid response format or no image URLs found');
    }
  } else {
    throw Exception('Failed to fetch image data');
  }

  return imageUrls;
}

}
