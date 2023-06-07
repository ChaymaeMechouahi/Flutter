import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyGalerie extends StatefulWidget {
  final List<String> imageUrls; // Tableau des URLs des images

  MyGalerie({Key? key, required this.imageUrls}) : super(key: key);

  @override
  _MyGalerie createState() => _MyGalerie();
}

class _MyGalerie extends State<MyGalerie> {
  int _selectedIndex = 0;
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth * 0.7;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imageUrls.length,
          carouselController: _carouselController,
          options: CarouselOptions(
          
            height: imageHeight,
            aspectRatio: 1,
            viewportFraction: 0.7,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
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

  List<Widget> _buildDots() {
    return widget.imageUrls.map((image) {
      int index = widget.imageUrls.indexOf(image);
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
