import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello/modules/participation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modules/participant.dart';

class PCourt extends StatefulWidget {
  final List<String> imageUrl;
  final List<Partcipation> participation;
  final List<Participant> participants;
  PCourt(
      {required this.imageUrl,
      required this.participation,
      required this.participants});
  @override
  _PCourtState createState() => _PCourtState();
}

class _PCourtState extends State<PCourt> {
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
          itemCount: widget.imageUrl.length,
          carouselController: _carouselController,
          options: CarouselOptions(
            height: imageWidth,
            aspectRatio: 1,
            viewportFraction: 0.7,
            initialPage: 0,
            enableInfiniteScroll: widget.imageUrl.length > 1,
            reverse: false,
            autoPlay: widget.imageUrl.length > 1,
            enlargeCenterPage: true,
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
                        widget.imageUrl[index],
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
                        (widget.participation.isNotEmpty &&
                                index < widget.participation.length)
                            ? widget.participation[index].prix
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
                        (widget.participation.isNotEmpty &&
                                index < widget.participation.length)
                            ? widget.participation[index].film
                            : '',
                        style: GoogleFonts.readexPro(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 241, 235)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        (widget.participation.isNotEmpty &&
                                index < widget.participation.length &&
                                widget.participants.isNotEmpty &&
                                index < widget.participants.length)
                            ? widget.participants[index].nom +
                                ' ' +
                                widget.participants[index].prenom
                            : '',
                        style: GoogleFonts.readexPro(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 241, 235)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        (widget.participation.isNotEmpty &&
                                index < widget.participation.length &&
                                widget.participants.isNotEmpty &&
                                index < widget.participants.length)
                            ? widget.participants[index].pays
                            : '',
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
    return widget.imageUrl.map((image) {
      int index = widget.imageUrl.indexOf(image);
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
