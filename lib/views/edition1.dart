import 'package:flutter/material.dart';

import '../controllers/BottomBar.dart';
import '../controllers/move.dart';

GlobalKey palmares = GlobalKey();
GlobalKey jury = GlobalKey();
class EditionUn extends StatefulWidget {
  final String imageUrl;
  final String date;
  final int editionNumber;
  final String dateF;

  EditionUn({
    required this.imageUrl,
    required this.date,
    required this.editionNumber,
    required this.dateF,
  });

  @override
  _EditionUnState createState() => _EditionUnState();
}

class _EditionUnState extends State<EditionUn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(
        onAwardsPressed: (BuildContext context) {},
        onHomePressed: retourPagePrincipale, // Use the function directly without passing its result
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
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken,
                      ),
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
                            'Du : ${widget.date}',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Text(
                            'Au : ${widget.dateF}',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  // Composants spécifiques à l'édition
                  child: buildEditionSpecificContent(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildEditionSpecificContent() {
    // Ajoutez les conditions ou boucles pour afficher les composants spécifiques à chaque édition
    // Utilisez les valeurs de widget.imageUrl, widget.date, widget.editionNumber, widget.dateF pour déterminer le contenu à afficher
    // Retournez le widget approprié pour chaque édition

    // Exemple : Afficher un texte différent pour chaque édition
    if (widget.editionNumber == 1) {
      return Text('Contenu de l\'édition 1');
    } else if (widget.editionNumber == 2) {
      return Text('Contenu de l\'édition 2');
    } else {
      return Text('Contenu par défaut');
    }
  }
}
