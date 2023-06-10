import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class Palmares extends StatefulWidget {
  final List<String> imageUrls; // Tableau des URLs des images
  final List<String> films;
  final List<String> awards;
  final List<String> noms;
  final List<String> pays;

  Palmares(
      {Key? key,
      required this.imageUrls,
      required this.awards,
      required this.films,
      required this.noms,
      required this.pays})
      : super(key: key);

  @override
  _PalmaresState createState() => _PalmaresState();
}

class _PalmaresState extends State<Palmares> {
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
                  width: 300,
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
                        color: Color.fromARGB(255, 255, 204, 185),
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.awards.length > index
                            ? widget.awards[index]
                            : '',
                        style: GoogleFonts.neuton(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 179, 151),
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
                        widget.films.length > index ? widget.films[index] : '',
                        style: GoogleFonts.castoroTitling(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 241, 235)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.noms.length > index
                            ? widget.noms[index]
                            : '', // Vérification de la longueur et de l'index
                        style: GoogleFonts.readexPro(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 241, 235)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.pays.length > index
                            ? widget.pays[index]
                            : '', // Vérification de la longueur et de l'index
                        style: GoogleFonts.neucha(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 174, 116, 95)),
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
