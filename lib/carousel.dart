import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarousel extends StatefulWidget {
  final VoidCallback onTap;

  MyCarousel({Key? key, required this.onTap}) : super(key: key);

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _selectedIndex = 0;
  CarouselController _carouselController = CarouselController();
  List<String> _carouselImages = [
    'https://marrakech-festival.com/wp-content/uploads/2022/09/img_edition_1.png',
    'https://marrakech-festival.com/wp-content/uploads/2022/09/img_edition_2.png',
    'https://marrakech-festival.com/wp-content/uploads/revslider/slider-2/fifm_17e.jpg',
    'https://marrakech-festival.com/wp-content/uploads/revslider/slider-2/fifm_e.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        (_carouselImages.isEmpty)
            ? CircularProgressIndicator()
            : CarouselSlider.builder(
                itemCount: _carouselImages.length,
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 230,
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
                  double imageWidth = screenWidth * 0.5;

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
                              image: NetworkImage(_carouselImages[index]),
                              fit: BoxFit.cover,
                              colorFilter: _getOpacityFilter(),
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
              ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildDots(),
        ),
      ],
    );
  }

  ColorFilter _getOpacityFilter() {
    double opacity =
        0.5; // Réglez ici l'opacité souhaitée pour toutes les images
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
