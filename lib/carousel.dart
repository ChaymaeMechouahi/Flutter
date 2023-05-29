import 'dart:convert';
import 'modules/image.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'controllers/connexion.dart';
List<int> editions = [18,17,16,15,14,13,12,11];
List<int> ids = [1,22,39,53,69,84,101,115];
class MyCarousel extends StatefulWidget {
  final VoidCallback onTap;

  MyCarousel({Key? key, required this.onTap}) : super(key: key);

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _selectedIndex = 0;
  List<Imge> _carouselImages = [];

  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        FutureBuilder<List<Imge>>(
future: fetchImagesFromAPI(editions, ids) as Future<List<Imge>>?,
          builder: (BuildContext context, AsyncSnapshot<List<Imge>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erreur : ${snapshot.error}');
            } else {
              _carouselImages = snapshot.data!;

              return CarouselSlider.builder(
                itemCount: _carouselImages.length,
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 280,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.6,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  double imageWidth = screenWidth * 0.6;

                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: imageWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: MemoryImage(base64Decode(_carouselImages[index].getImg)), // Décodez l'image à partir du champ 'img' de l'instance de la classe Image
                              fit: BoxFit.cover,
                              colorFilter: _getOpacityFilter(index),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Texte 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Texte 2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildDots(),
        ),
      ],
    );
  }


  ColorFilter _getOpacityFilter(int index) {
    double opacity = (index == _selectedIndex) ? 1.0 : 0.5;
    return ColorFilter.matrix([
      opacity,
      0,
      0,
      0,
      0,
      0,
      opacity,
      0,
      0,
      0,
      0,
      0,
      opacity,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
  }

  List<Widget> _buildDots() {
    return _carouselImages.map((image) {
      int index = _carouselImages.indexOf(image);
      return Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedIndex == index ? Colors.black : Colors.grey,
        ),
      );
    }).toList();
  }
}
