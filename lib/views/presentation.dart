import 'package:flutter/material.dart';
import 'package:flutter_hello/galerie.dart';

import '../controllers/move.dart';

GlobalKey title = GlobalKey();
GlobalKey gallery = GlobalKey();

class MyArtPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://picsum.photos/id/10/300/200',
    'https://picsum.photos/id/100/300/200',
    'https://picsum.photos/id/1000/300/200'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown[200],
        child: Container(
          height: 80,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.brown[200],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.brown[200],
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                retourPagePrincipale(context);
                              },
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.brown[200],
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Action à effectuer lors du clic sur le bouton Home
                              },
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.brown[200],
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.emoji_events,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Action à effectuer lors du clic sur le bouton Awards
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Titre principal',
                        key: title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(
                          height: 200, // Hauteur du rectangle
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'L’une des images fortes de cette 14e édition restera l’hommage rendu à l’acteur égyptien Adel Imam, qui jouit d’une immense popularité au Maroc auprès de plusieurs générations. L’Étoile d’or du Festival de Marrakech lui est remise par Touria Jebrane, comédienne et ancienne ministre de la culture, devant une salle enthousiaste et émue.\n\nJeremy Irons, qui connaît bien le Festival de Marrakech pour en avoir présidé le jury court métrage en 2003, livre un discours vibrant pour le rapprochement des cultures tandis que Viggo Mortensen déclare en dialecte marocain à quel point il se sent chez lui quand il est au Maroc.\n\nA travers les hommages rendus aux producteurs délégués marocains, Zakaria Alaoui et Khadija Alami, le Festival entend récompenser les efforts de deux professionnels chevronnés qui n’ont cessé d’œuvrer pour que le Maroc soit une terre d’accueil pour les productions étrangères.\n\nCette année, le festival rend hommage à l’une des plus grandes et des plus riches cinématographies au monde : le Japon ! Présidée par le grand maître Kore-eda Hirokazu, la délégation se compose de réalisateurs, acteurs, producteurs et professionnels divers.\n\nLe jury, présidé par la grande actrice française Isabelle Huppert, une habituée du festival depuis ses débuts, est constitué de personnalités marquantes telles que les réalisateurs Cristian Mungiu (Roumanie), Mario Martone (Italie) et Moumen Smihi (Maroc). L’Étoile d’or est attribuée à « Corrections class », premier long métrage du moscovite Ivan I. Tverdoskiy, alors âgé de 26 ans.\n\nLe prix Cinécoles dont le jury est présidé par le cinéaste mauritanien Abderrahman Cissako est décerné à Dalto de Essam Doukhou.\n\nFidèle à sa tradition d’ouvrir des espaces de dialogue avec les grands noms du cinéma mondial, le Festival accueille les cinéastes Bille August (Danemark), Alex de la Iglesia (Espagne) et Benoit Jacquot (France) pour des masterclass.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
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
                      MyGalerie(imageUrls: imageUrls), // Appel à MyGalerie
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
