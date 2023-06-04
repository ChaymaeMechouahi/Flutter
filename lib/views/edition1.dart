import 'package:flutter/material.dart';
import '../controllers/connexion.dart';
import '../Palmares.dart';

class EditionUn extends StatefulWidget {
  final int editionNumber;

  EditionUn({
    required this.editionNumber,
  });

  @override
  _EditionUnState createState() => _EditionUnState();
}

class _EditionUnState extends State<EditionUn> {
  List<int> ids = [2, 3, 4, 5];
  int num = 1;
  late Future<List<String>> _imageUrlsFuture;

  @override
  void initState() {
    super.initState();
    _imageUrlsFuture = _fetchImageUrl();
  }

  Future<List<String>> _fetchImageUrl() async {
    try {
      List<String> imageUrls = await APIManager.fetchImageUrl(ids, num);
      return imageUrls;
    } catch (error) {
      print('Erreur lors de la récupération des URLs des images: $error');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Palmarès',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Voir plus',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<List<String>>(
              future: _imageUrlsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Palmares(imageUrls: snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text(
                      'Erreur lors de la récupération des URLs des images');
                }
                // Show a progress indicator while loading
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
