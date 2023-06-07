import 'package:flutter/material.dart';
import 'BottomBar.dart';
import '../controllers/connexion.dart';
import '../controllers/move.dart';
import 'galerie.dart';
import 'awards.dart';

GlobalKey title = GlobalKey();
GlobalKey gallery = GlobalKey();

class MyArtPage extends StatefulWidget {
  final String imageUrl;
  final String date;
  final int editionNumber;

  MyArtPage({
    required this.imageUrl,
    required this.date,
    required this.editionNumber,
  });

  @override
  _MyArtPageState createState() => _MyArtPageState();
}

class _MyArtPageState extends State<MyArtPage> {
  String DateF = '';
  String titre = '';
  String texte = '';
  List<String> imageUrls = []; // Updated: Initialize imageUrls as an empty list

  @override
  void initState() {
    super.initState();
    fetchEditionDate();
    fetchEditionTitre();
    fetchEditionTexte();
    fetchImageUrlList();
  }

  void fetchEditionDate() async {
    try {
      String editionDate =
          await APIManager.fetchEditionDateF(widget.editionNumber);
      setState(() {
        DateF = editionDate;
      });
    } catch (error) {
      print('Erreur lors de la récupération de la date de l\'édition: $error');
    }
  }

  void fetchEditionTitre() async {
    try {
      String editionTitre =
          await APIManager.fetchEditionTitre(widget.editionNumber);
      setState(() {
        titre = editionTitre;
      });
    } catch (error) {
      print('Erreur lors de la récupération du titre de l\'édition: $error');
    }
  }

  void fetchEditionTexte() async {
    try {
      String editionTexte =
          await APIManager.fetchEditionTexte(widget.editionNumber);
      setState(() {
        texte = editionTexte;
      });
    } catch (error) {
      print('Erreur lors de la récupération du texte de l\'édition: $error');
    }
  }

  void fetchImageUrlList() async {
    try {
      List<String> fetchedImageUrls =
          await APIManager.fetchImageUrlList(widget.editionNumber);
      print(widget.editionNumber);
      print(fetchedImageUrls);

      setState(() {
        imageUrls = fetchedImageUrls;
      });
    } catch (error) {
      print('Erreur lors de la récupération des URLs des images: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(
        onAwardsPressed: (BuildContext) {
          storeInfo();
        },
        onHomePressed: (BuildContext) {
          retourPagePrincipale(BuildContext);
        },
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double screenWidth = constraints.maxWidth;
          final double imageHeight =
              screenWidth / MediaQuery.of(context).size.aspectRatio * 0.7;

          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      child: Container(
                        width: screenWidth,
                        height: imageHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.editionNumber}° EDITION',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Du :${widget.date}',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            'Au :$DateF',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  scrollToSection(context,
                                      title); // Naviguer vers l'article
                                },
                                child: TextButton(
                                  onPressed:
                                      null, // Supprimez null et ajoutez votre action ici
                                  child: Text(
                                    'Lire l\'article',
                                    style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  scrollToSection(context,
                                      gallery); // Naviguer vers la galerie
                                },
                                child: TextButton(
                                  onPressed:
                                      null, // Supprimez null et ajoutez votre action ici
                                  child: Text(
                                    'Galerie',
                                    style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titre,
                        key: title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(168, 151, 106, 90)
                                  .withOpacity(0.5),
                              spreadRadius: 10,
                              blurRadius: 2,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: Text(
                            texte,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 72, 69, 69),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Center(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'GALERIE',
                                    key: gallery,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.brown,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.brown,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Voir ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.brown,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'plus',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      imageUrls.isNotEmpty
                          ? MyGalerie(imageUrls: imageUrls)
                          : CircularProgressIndicator(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void storeInfo() {
    String imageUrl = widget.imageUrl;
    String date = widget.date;
    String dateF = DateF;
    int editionNumber = widget.editionNumber;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Edit(
          imageUrl: imageUrl,
          date: date,
          editionNumber: editionNumber,
          dateF: dateF,
        ),
      ),
    );
  }
}
