import 'package:flutter/material.dart';
import 'package:flutter_hello/views/Pcourt.dart';
import '../controllers/connexion.dart';
import '../modules/participant.dart';
import '../modules/participation.dart';
import 'Palmares.dart';
import 'jury.dart';

class EditionQuatorze extends StatefulWidget {
  final int editionNumber;

  EditionQuatorze({
    required this.editionNumber,
  });

  @override
  _EditionQuatorzeState createState() => _EditionQuatorzeState();
}

class _EditionQuatorzeState extends State<EditionQuatorze> {
  List<int> ids = [157,168,159,160]; //Palmares images
  List<int> idsNom = [266,267,268,269]; //Palmares Noms
  int num = 14;
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
  late Future<List<String>> homageImage;
  late Future<List<String>> PalCinImage;
  List<Participant> homageParticipants = [];
  List<Partcipation> homageParticipations = [];
  List<Participant> masterParticipants = [];
  List<Partcipation> masterParticipations = [];
  @override
  void initState() {
    super.initState();
    _imageUrlsFuture = _fetchImageUrl();
    _awardsFuture = _fetchEditionAwards();
    _filmsFuture = _fetchEditionFilms();
    _nomsFuture = _fetchEditionNoms();
    _paysFuture = _fetchEditionPays();
    _imageUrlFuture = _fetchImageUrl();
    _fetchJuryParticipants();
    _fetchPCourtParticipants();
    _fetchData();
    homageImage = _fetchImageThree();
    _fetchImageMaster();
    _fetchDataMaster();
    _fetchMaster();
  }

//Palmares
  Future<List<String>> _fetchEditionAwards() async {
    try {
      List<String> awards =
          await APIManager.fetchParticipationAwards(idsNom, num);
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
      List<String> films = await APIManager.fetchEditionFilms(idsNom, num);
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
      String imageUrl = await APIManager.fetchImage(num, 161);
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
          [270,271,272,273,274,275,276,277]);
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

//hMMAGES
  Future<List<String>> _fetchImageThree() async {
    try {
      List<String> imageUrl =
          await APIManager.fetchImageUrl([162,163,164,165,166,167], num);
      return imageUrl;
    } catch (error) {
      print('Erreur lors de la récupération de l\'URL de l\'image: $error');
      return [];
    }
  }

  //hOMMAGE
  Future<List<Partcipation>> _fetchData() async {
    List<Partcipation> participations = [];

    try {
      List<String> awards = await APIManager.fetchParticipationAwards(
          [278,279,280,281,282,283], num); //Participation
      List<String> films = await APIManager.fetchEditionFilms(
          [278,279,280,281,282,283], num); //Participaton
      for (int i = 0; i < awards.length; i++) {
        Partcipation participation = Partcipation.empty();
        participation.setPrix(awards[i]);
        participation.setFilm(films[i]);
        participations.add(participation);
        setState(() {
          homageParticipations = participations;
        });
      }
    } catch (error) {
      print('erreur: $error');
      return [];
    }

    return participations;
  }

//hOMMAGE
  Future<void> _fetchPCourtParticipants() async {
    try {
      List<Participant> participants = await APIManager.fetchParticipants(
          [278,279,280,281,282,283]); //paticipant
      if (participants != null && participants.isNotEmpty) {
        setState(() {
          homageParticipants = participants;
        });
      } else {
        print('Aucun participant trouvé');
      }
    } catch (error) {
      print('Erreur lors de la récupération des participants : $error');
    }
  }

//MasterClass

  Future<List<String>> _fetchImageMaster() async {
    try {
      List<String> imageUrl =
          await APIManager.fetchImageUrl([168,169,170], num);
      return imageUrl;
    } catch (error) {
      print('Erreur lors de la récupération de l\'URL de l\'image: $error');
      return [];
    }
  }

//MasterClass

  Future<List<Partcipation>> _fetchDataMaster() async {
    List<Partcipation> participations = [];

    try {
      List<String> awards = await APIManager.fetchParticipationAwards(
          [284,285,286], num); //Participation
      List<String> films = await APIManager.fetchEditionFilms(
          [284,285,286], num); //Participaton
      for (int i = 0; i < awards.length; i++) {
        Partcipation participation = Partcipation.empty();
        participation.setPrix(awards[i]);
        participation.setFilm(films[i]);
        participations.add(participation);
        setState(() {
          masterParticipations = participations;
        });
      }
    } catch (error) {
      print('erreur: $error');
      return [];
    }

    return participations;
  }

//MasterClass

  Future<void> _fetchMaster() async {
    try {
      List<Participant> participants =
          await APIManager.fetchParticipants([284,285,286]); //paticipant
      if (participants != null && participants.isNotEmpty) {
        setState(() {
          masterParticipants = participants;
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
            SizedBox(height: 30),
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
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jury',
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
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hommage',
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
            SizedBox(height: 30),
            FutureBuilder<List<String>>(
              future: homageImage,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PCourt(
                    imageUrl: snapshot.data!,
                    participation: homageParticipations,
                    participants: homageParticipants,
                  );
                } else if (snapshot.hasError) {
                  return Text(
                      'Erreur lors de la récupération de l\'URL de l\'image');
                }
                return CircularProgressIndicator();
              },
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MasterClass',
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
            SizedBox(height: 30),
            FutureBuilder<List<String>>(
              future: _fetchImageMaster(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PCourt(
                    imageUrl: snapshot.data!,
                    participation: masterParticipations,
                    participants: masterParticipants,
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