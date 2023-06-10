import 'package:flutter/material.dart';
import '../modules/participant.dart';
import 'package:google_fonts/google_fonts.dart';

class Jury extends StatelessWidget {
  final String imageUrl;
  final List<Participant> participants;

  Jury({required this.imageUrl, required this.participants});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 300, // Hauteur fixe pour la liste des participants
            child: ListView.separated(
              itemCount: participants.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0), // Aucun espace entre les éléments
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${participants[index].getNom} ${participants[index].getPrenom}',
                    style: GoogleFonts.libreCaslonText(
                      fontSize: 20,
                      color: Color.fromARGB(255, 63, 59, 57),
                    ),
                  ),
                  subtitle: Text(
                    participants[index].getPays,
                    style: GoogleFonts.neucha(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 125, 82, 67),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
