import 'package:flutter/material.dart';
import 'package:flutter_hello/views/oneAward.dart';
import '../controllers/connexion.dart';
import '../modules/participant.dart';
import '../modules/participation.dart';
import 'Palmares.dart';
import 'jury.dart';

class EditionDeux extends StatefulWidget {
  final int editionNumber;

  EditionDeux({
    required this.editionNumber,
  });

  @override
  _EditionDeuxState createState() => _EditionDeuxState();
}

class _EditionDeuxState extends State<EditionDeux> {
  List<int> ids = [9,10,11,12];
  List<int> idsNom = [15, 16, 18, 20];
  int num = 2;
  late Future<List<String>> _imageUrlFuture;
  late Future<List<String>> _imageUrlsFuture;
  late Future<List<String>> _filmsFuture;
  late Future<List<String>> _awardsFuture;
  late Future<List<String>> _nomsFuture;
  late Future<List<String>> _paysFuture;
  List<String> awardsList = [];
  List<String> filmsList = [];
  List<String> nomsList = [];
  List<String> paysList = [];
  List<Participant> juryParticipants = [];
  List<Participant> PcourtParticipants = [];
  List<Partcipation> participationsList = [];
  late Future<List<String>> _fetchedImage;
  @override
  void initState() {
    super.initState();
    _imageUrlsFuture = _fetchImageUrl();
    _awardsFuture = _fetchEditionAwards();
    _filmsFuture = _fetchEditionFilms();
    _nomsFuture = _fetchEditionNoms();
    _paysFuture = _fetchEditionPays();
    _imageUrlFuture = _fetchImageUrl();
    _fetchData();
    _fetchJuryParticipants();
    _fetchPCourtParticipants();
    _fetchedImage = _fetchImageThree();
  }

//Palmares
  Future<List<String>> _fetchEditionAwards() async {
    try {
      List<String> awards = await APIManager.fetchParticipationAwards(ids, num);
      setState(() {
        awardsList = awards;
      });
      return awards;
    } catch (error) {
      print('Erreur lors de la récupération des awards: $error');
      return [];
    }
  }
//Noms des palmares
  Future<List<String>> _fetchEditionNoms() async {
    try {
      List<String> noms = await APIManager.fetchEditionNoms(idsNom);
      setState(() {
        nomsList = noms;
      });
      return noms;
    } catch (error) {
      print('Erreur lors de la récupération des noms: $error');
      return [];
    }
  }
//Pays des palmares
  Future<List<String>> _fetchEditionPays() async {
    try {
      List<String> pays = await APIManager.fetchEditionPays(idsNom);
      setState(() {
        paysList = pays;
      });
      return pays;
    } catch (error) {
      print('Erreur lors de la récupération des pays: $error');
      return [];
    }
  }
//image palmares
  Future<List<String>> _fetchImageUrl() async {
    try {
      List<String> imageUrls = await APIManager.fetchImageUrl(ids, num);
      return imageUrls;
    } catch (error) {
      print('Erreur lors de la récupération des URLs des images: $error');
      return [];
    }
  }
//Films palmares
  Future<List<String>> _fetchEditionFilms() async {
    try {
      List<String> films = await APIManager.fetchEditionFilms(ids, num);
      setState(() {
        filmsList = films;
      });
      return films;
    } catch (error) {
      print('Erreur lors de la récupération des films: $error');
      return [];
    }
  }
//image jury
  Future<String> _fetchImage() async {
    try {
      String imageUrl = await APIManager.fetchImage(num, 13);
      return imageUrl;
    } catch (error) {
      print('Erreur lors de la récupération de l\'URL de l\'image: $error');
      return '';
    }
  }
//participants jury 
  Future<void> _fetchJuryParticipants() async {
    try {
      List<Participant> participants = await APIManager.fetchParticipants(
          [21, 22, 23, 24, 25, 26, 27, 28, 29, 30]);
      if (participants != null && participants.isNotEmpty) {
        setState(() {
          juryParticipants = participants;
        });
      } else {
        print('Aucun participant du jury trouvé');
      }
    } catch (error) {
      print('Erreur lors de la récupération des participants du jury: $error');
    }
  }
//Palmares cout metrage Image 
 
  Future<List<String>> _fetchImageThree() async {
    try {
      List<String> imageUrl = await APIManager.fetchImageUrl([14,15], num);
      return imageUrl;
    } catch (error) {
      print('Erreur lors de la récupération de l\'URL de l\'image: $error');
      return [];
    }
  }
  //Palmares court metrage 
  Future<List<Partcipation>> _fetchData() async {
    List<Partcipation> participations = [];

    try {
      List<String> awards =
          await APIManager.fetchParticipationAwards([31, 32], num);
      List<String> films = await APIManager.fetchEditionFilms([31, 32], num);
      for (int i = 0; i < awards.length; i++) {
        Partcipation participation = Partcipation.empty();
        participation.setPrix(awards[i]);
        participation.setFilm(films[i]);
        participations.add(participation);
        setState(() {
          participationsList = participations;
        });
      }
    } catch (error) {
      print('erreur: $error');
      return [];
    }

    return participations;
  }
//Palmares court metrage
  Future<void> _fetchPCourtParticipants() async {
    try {
      List<Participant> participants = await APIManager.fetchParticipants([31,32]);
      if (participants != null && participants.isNotEmpty) {
        setState(() {
          PcourtParticipants = participants;
        });
      } else {
        print('Aucun participant trouvé');
      }
    } catch (error) {
      print('Erreur lors de la récupération des participants : $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Palmarès',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Voir plus',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<List<String>>(
              future: _imageUrlsFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Palmares(
                      imageUrls: snapshot.data!,
                      awards: awardsList,
                      films: filmsList,
                      noms: nomsList,
                      pays: paysList);
                } else if (snapshot.hasError) {
                  return Text(
                      'Erreur lors de la récupération des URLs des images');
                }
                // Show a progress indicator while loading
                return Center(child: CircularProgressIndicator());
              },
            ),
            FutureBuilder<String>(
              future: _fetchImage(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Jury(
                    imageUrl: snapshot.data!,
                    participants: juryParticipants,
                  );
                } else if (snapshot.hasError) {
                  return Text(
                      'Erreur lors de la récupération de l\'URL de l\'image');
                }
                return CircularProgressIndicator();
              },
            ),
            SizedBox(height: 20),
            FutureBuilder<List<String>>(
              future: _fetchedImage,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PCourt(
                    imageUrl: snapshot.data!,
                    participation: participationsList,
                    participants: PcourtParticipants,
                  );
                } else if (snapshot.hasError) {
                  return Text(
                      'Erreur lors de la récupération de l\'URL de l\'image');
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
