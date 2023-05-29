import 'package:flutter/material.dart';

import '../controllers/BottomBar.dart';
import '../controllers/move.dart';
import '../galerie.dart';

GlobalKey title = GlobalKey();
GlobalKey gallery = GlobalKey();

class EditionOne extends StatelessWidget {
  final List<String> imageUrls = [
    'https://picsum.photos/id/10/300/200',
    'https://picsum.photos/id/100/300/200',
    'https://picsum.photos/id/1000/300/200'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(
        onAwardsPressed: (BuildContext) {},
        onHomePressed: (BuildContext) {
          retourPagePrincipale(BuildContext);
        },
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double screenWidth = constraints.maxWidth;
            final double imageHeight =
                screenWidth / MediaQuery.of(context).size.aspectRatio * 0.7;

            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: screenWidth,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://picsum.photos/id/1000/300/200'),
                          fit: BoxFit.cover,
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
                            'Titre en gras en noir',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Première ligne de la date',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Deuxième ligne de la date',
                            style: TextStyle(fontSize: 14),
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
                                    'Gallerie',
                                    style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
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
                //Palmares
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
                              key: gallery,
                              'PALMARES',
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
                      //Palmares Court Metrage
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
                                    key: gallery,
                                    'PALMARES COURT METRAGE',
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
                      MyGalerie(imageUrls: imageUrls),
                    ],
                  ),
                ),
                //Ma gallerie
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
                              key: gallery,
                              'GALERIE',
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
                MyGalerie(imageUrls: imageUrls),
              ],
            );
          },
        ),
      ),
    );
  }
}
