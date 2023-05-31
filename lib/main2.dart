import 'package:flutter/material.dart';

import 'controllers/connexion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image URLs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchEditionDates();
  }

  Future<void> fetchEditionDates() async {
    List<int> nums = [1, 2, 3, 4, 5];

    try {
      List<String> dates = await APIManager.fetchEditionDates(nums);
      setState(() {
        imageUrls = dates;
      });
    } catch (error) {
      print('Error fetching edition dates: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image URLs'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(imageUrls[index]),
            );
          },
        ),
      ),
    );
  }
}
