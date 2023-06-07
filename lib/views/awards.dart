import 'package:flutter/material.dart';
import 'package:flutter_hello/views/edition10.dart';
import 'package:flutter_hello/views/edition11.dart';
import 'package:flutter_hello/views/edition12.dart';
import 'package:flutter_hello/views/edition13.dart';
import 'package:flutter_hello/views/edition17.dart';
import 'package:flutter_hello/views/edition18.dart';
import 'package:flutter_hello/views/edition3.dart';
import 'package:flutter_hello/views/edition5.dart';
import 'package:flutter_hello/views/edition6.dart';
import 'package:flutter_hello/views/edition7.dart';
import 'package:flutter_hello/views/edition8.dart';
import 'package:flutter_hello/views/edition9.dart';
import 'BottomBar.dart';
import '../controllers/move.dart';
import 'edition1.dart';
import 'edition14.dart';
import 'edition15.dart';
import 'edition16.dart';
import 'edition2.dart';
import 'edition4.dart';

GlobalKey palmares = GlobalKey();
GlobalKey jury = GlobalKey();

class Edit extends StatefulWidget {
  final String imageUrl;
  final String date;
  final int editionNumber;
  final String dateF;

  Edit({
    required this.imageUrl,
    required this.date,
    required this.editionNumber,
    required this.dateF,
  });

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(
        onAwardsPressed: (BuildContext context) {},
        onHomePressed: retourPagePrincipale,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
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
                        '${widget.editionNumber}° EDITION',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Du : ${widget.date}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        'Au : ${widget.dateF}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              child: buildEditionSpecificContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEditionSpecificContent() {
    if (widget.editionNumber == 1) {
      return EditionUn(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 2) {
      return EditionDeux(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 3) {
      return EditionTrois(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 4) {
      return EditionQuatre(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 5) {
      return EditionCinq(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 6) {
      return EditionSix(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 7) {
      return EditionSept(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 8) {
      return EditionHuit(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 9) {
      return EditionNeuf(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 10) {
      return EditionDix(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 11) {
      return EditionOnze(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 12) {
      return EditionDouze(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 13) {
      return EditionTreize(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 14) {
      return EditionQuatorze(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 15) {
      return EditionQuinze(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 16) {
      return EditionSeize(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 17) {
      return EditionDixSept(editionNumber: widget.editionNumber);
    } else if (widget.editionNumber == 18) {
      return EditionDixHuit(editionNumber: widget.editionNumber);
    } else {
      return Text('Contenu par défaut');
    }
  }
}
