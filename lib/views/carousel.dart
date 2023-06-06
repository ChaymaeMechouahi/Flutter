import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_hello/views/presentation.dart';
import '../controllers/connexion.dart';

class MyCarousel extends StatefulWidget {
  final VoidCallback onTap;

  MyCarousel({Key? key, required this.onTap}) : super(key: key);

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _selectedIndex = 0;
  CarouselController _carouselController = CarouselController();
  List<String> _carouselImages = [];
  List<String> _carouselDates = [];
  List<int> nums = [1, 2, 3, 4, 5,6,7,8,9];
  List<int> ids = [1, 8, 17, 27, 37,48,58,69,79];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      List<String> imageUrls = await APIManager.fetchImageData(nums, ids);
      List<String> editionDates = await APIManager.fetchEditionDates(nums);
      setState(() {
        _carouselImages = imageUrls;
        _carouselDates = editionDates;
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void _storeImageInformation() {
    String imageUrl = _carouselImages[_selectedIndex];
    String date = _carouselDates[_selectedIndex];
    int editionNumber = nums[_selectedIndex];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyArtPage(
          imageUrl: imageUrl,
          date: date,
          editionNumber: editionNumber,
        ),
      ),
    );
  }

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
                  int num = nums[index];
                  String date = _carouselDates[index];

                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                          _storeImageInformation(); // Appel de la fonction pour stocker les informations
                          widget
                              .onTap(); // Appel de la fonction onTap fournie dans les paramètres
                        },
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
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '$num °EDITION',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                date,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
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
    return ColorFilter.matrix([
      1, 0, 0, 0, 0, // Red
      0, 1, 0, 0, 0, // Green
      0, 0, 1, 0, 0, // Blue
      0, 0, 0, 1, 0, // Alpha (Opacity)
    ]);
  }

  List<Widget> _buildDots() {
    return _carouselImages.map((image) {
      int index = _carouselImages.indexOf(image);
      int num = nums[index];

      return Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedIndex == index ? Colors.black : Colors.grey,
        ),
        child: Text(
          '$num',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      );
    }).toList();
  }
}
