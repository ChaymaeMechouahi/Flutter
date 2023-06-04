import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Award extends StatefulWidget {
  final List<String> imageUrls;
  final List<String> films;
  final List<String> awards;
  final List<String> noms;
  final List<String> pays;

  Award(
      {Key? key,
      required this.imageUrls,
      required this.awards,
      required this.films,
      required this.noms,
      required this.pays})
      : super(key: key);

  @override
  _AwardState createState() => _AwardState();
}

class _AwardState extends State<Award> {
  int _selectedIndex = 0;
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double imageHeight = 350.0; // Hauteur fixe pour toutes les images
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = screenWidth * 0.7;
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imageUrls.length,
          carouselController: _carouselController,
          options: CarouselOptions(
            height: imageWidth,
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
            return Stack(
              children: [
                Container(
                  height: imageHeight,
                  width: imageWidth,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(
                            0.5), // Opacité et couleur sombre souhaitées
                        BlendMode.srcOver,
                      ),
                      child: Image.network(
                        widget.imageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Row(
                    children: [
                      Icon(
                        Icons.emoji_events,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.awards.length > index
                            ? widget.awards[index]
                            : '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.films.length > index
                            ? widget.films[index]
                            : '', // Vérification de la longueur et de l'index
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.noms.length > index
                            ? widget.noms[index]
                            : '', // Vérification de la longueur et de l'index
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.pays.length > index
                            ? widget.pays[index]
                            : '', // Vérification de la longueur et de l'index
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
