import 'package:flutter/material.dart';
import 'package:flutter_hello/controllers/connexion.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiResponse = '';

  Future<void> fetchData() async {
    print('je suis ici');
    try {
      print('je suis ici 2');

      var response = await APIManager.fetchData('/editions');
      setState(() {
        apiResponse = response.body;
      });
    } catch (error) {
      setState(() {
        print(error);
        apiResponse = 'Erreur lors de la requête API';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page principale'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Appeler l\'API'),
            ),
            SizedBox(height: 16),
            Text(
              apiResponse,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
