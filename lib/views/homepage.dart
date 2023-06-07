import 'package:flutter/material.dart';
import 'package:flutter_hello/views/carousel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown[200],
        child: Container(
          height: 60,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Color.fromARGB(144, 182, 170, 158),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 112, 94, 88),
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          child: GestureDetector(
                            onTap: () {
                              // Action à effectuer lors du clic sur le logo
                            },
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '20 EME EDITION',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '24 NOVEMBRE AU 02 DECEMBRE 2023',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 177, 114, 69),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 37,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.brown,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.brown,
                        ),
                        onPressed: () {
                          // Action à effectuer lors du clic sur la loupe de recherche
                        },
                      ),
                      Expanded(
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: 'Recherchez une édition',
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            // Action à effectuer lors de la saisie de texte
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
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
                        'ARCHIVE',
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
          SizedBox(height: 30),
          Expanded(
            child: Container(
              child: MyCarousel(
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
