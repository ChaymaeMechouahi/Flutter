import 'package:http/http.dart' as http;

class ApiEdition {
  static const String baseUrl = 'http://localhost:3005/editions';

  Future<http.Response> fetchData(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.get(url);
    return response;
  }
}
