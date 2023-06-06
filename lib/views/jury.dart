import 'package:flutter/material.dart';
import '../modules/participant.dart';

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
            height: 150, // Hauteur fixe pour la liste des participants
            child: ListView.separated(
              itemCount: participants.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: 0), // Aucun espace entre les éléments
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      '${participants[index].getNom} ${participants[index].getPrenom}'),
                  subtitle: Text(participants[index].getPays),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
