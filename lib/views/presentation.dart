import 'package:flutter/material.dart';

import '../controllers/BottomBar.dart';
import '../controllers/connexion.dart';
import '../controllers/move.dart';

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

  @override
  void initState() {
    super.initState();
    fetchEditionDate();
    fetchEditionTitre();
    fetchEditionTexte();
  }

  void fetchEditionDate() async {
    try {
      String editionDate =
          await APIManager.fetchEditionDateF(widget.editionNumber);
      setState(() {
        DateF = editionDate;
      });
    } catch (error) {
      // Gérer l'erreur
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
      // Gérer l'erreur
      print('Erreur lors de la récupération de lu titre de l\'édition: $error');
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
      // Gérer l'erreur
      print('Erreur lors de la récupération du texte  de l\'édition: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(
        onAwardsPressed: (BuildContext) {},
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
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Du :${widget.date}',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Text(
                            'Au :$DateF',
                            style: TextStyle(fontSize: 14, color: Colors.white),
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
                                      gallery); // Naviguer vers la gallerie
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
                          color: const Color.fromARGB(255, 5, 5, 5),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: MediaQuery.of(context).size.height *
                            0.3, // Ajustez la hauteur selon vos besoins
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: Text(
                            texte,
                            style: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
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
                      // MyGalerie(imageUrls: imageUrls), // Appel à MyGalerie
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
}
