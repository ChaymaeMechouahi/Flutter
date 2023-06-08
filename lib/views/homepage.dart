import 'package:flutter/material.dart';
import 'package:flutter_hello/views/carousel.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '20 EME EDITION',
                          style: GoogleFonts.merriweather(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 23, 23, 23)),
                        ),
                        Text(
                          '24 NOVEMBRE AU 02 DECEMBRE 2023',
                          style: GoogleFonts.merriweather(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 177, 114, 69)),
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
          SizedBox(height: 10),
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
                        style: GoogleFonts.workSans(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
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
                          style: GoogleFonts.workSans(
                            fontSize: 16,
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
          SizedBox(height: 10),
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
