import 'package:flutter/material.dart';
import 'package:flutter_hello/views/Pcourt.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/connexion.dart';
import '../modules/participant.dart';
import '../modules/participation.dart';
import 'Palmares.dart';
import 'jury.dart';

class EditionDixHuit extends StatefulWidget {
  final int editionNumber;

  EditionDixHuit({
    required this.editionNumber,
  });

  @override
  _EditionDixHuitState createState() => _EditionDixHuitState();
}

class _EditionDixHuitState extends State<EditionDixHuit> {
  List<int> ids = [219, 220, 221, 222, 223]; //Palmares images
  List<int> idsNom = [354, 355, 356, 357, 358]; //Palmares Noms
  int num = 18;
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
      String imageUrl = await APIManager.fetchImage(num, 224);
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
          [359, 360, 361, 362, 363, 364, 365, 366, 367]);
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
          await APIManager.fetchImageUrl([225, 226, 227, 228], num);
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
          [368, 369, 370, 371], num); //Participation
      List<String> films = await APIManager.fetchEditionFilms(
          [368, 369, 370, 371], num); //Participaton
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
      List<Participant> participants =
          await APIManager.fetchParticipants([368, 369, 370, 371]); //paticipant
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

//Conversation avec

  Future<List<String>> _fetchImageMaster() async {
    try {
      List<String> imageUrl = await APIManager.fetchImageUrl(
          [229, 230, 231, 232, 233, 234, 235, 236, 237, 238], num);
      return imageUrl;
    } catch (error) {
      print('Erreur lors de la récupération de l\'URL de l\'image: $error');
      return [];
    }
  }

//Conversation avec

  Future<List<Partcipation>> _fetchDataMaster() async {
    List<Partcipation> participations = [];

    try {
      List<String> awards = await APIManager.fetchParticipationAwards(
          [372, 373, 374, 375, 376, 377, 378, 379, 380, 381],
          num); //Participation
      List<String> films = await APIManager.fetchEditionFilms(
          [372, 373, 374, 375, 376, 377, 378, 379, 380, 381],
          num); //Participaton
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

//Conversation avec

  Future<void> _fetchMaster() async {
    try {
      List<Participant> participants = await APIManager.fetchParticipants(
          [372, 373, 374, 375, 376, 377, 378, 379, 380, 381]); //paticipant
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
                    style: GoogleFonts.workSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'Voir plus',
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                      color: Colors.brown,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Jury',
                    style: GoogleFonts.workSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
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
                    style: GoogleFonts.workSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'Voir plus',
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                      color: Colors.brown,
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
                    'Conversation Avec',
                    style: GoogleFonts.workSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'Voir plus',
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                      color: Colors.brown,
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
