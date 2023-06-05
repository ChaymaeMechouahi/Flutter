import 'package:flutter/material.dart';
import '../controllers/BottomBar.dart';
import '../controllers/move.dart';
import 'edition1.dart';
import 'edition2.dart';

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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Du : ${widget.date}',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Text(
                        'Au : ${widget.dateF}',
                        style: TextStyle(fontSize: 14, color: Colors.white),
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
    } else {
      return Text('Contenu par défaut');
    }
  }
}
