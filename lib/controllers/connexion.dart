import 'package:http/http.dart' as http;

class APIManager {
  static const String baseURL = 'http://192.168.1.112:3005';

  static Future<http.Response> fetchData(String endpoint) async {
    var url = Uri.parse('$baseURL/$endpoint');
    var response = await http.get(url);
    print('connexion reçu');
    return response;
  }
}
