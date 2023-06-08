import 'package:flutter/material.dart';
import 'package:flutter_hello/views/Pcourt.dart';
import '../controllers/connexion.dart';
import '../modules/participant.dart';
import '../modules/participation.dart';
import 'Palmares.dart';
import 'jury.dart';

class EditionOnze extends StatefulWidget {
  final int editionNumber;

  EditionOnze({
    required this.editionNumber,
  });

  @override
  _EditionOnzeState createState() => _EditionOnzeState();
}

class _EditionOnzeState extends State<EditionOnze> {
  List<int> ids = [105, 106, 107, 108, 109]; //Palmares images
  List<int> idsNom = [192, 193, 194, 195, 196]; //Palmares Noms
  int num = 11;
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
  List<Participant> PCinParticipants = [];
  List<Partcipation> PCinParticipations = [];
  List<Participant> posthumeParticipants = [];
  List<Partcipation> posthumeParticipations = [];
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
    PalCinImage = _fetchImagePalCin();
    _fetchDataPCint();
    _fetchPCintParticipants();

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
      String imageUrl = await APIManager.fetchImage(num, 110);
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
          [197, 198, 199, 200, 201, 202, 203, 204, 205]);
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

//PALMARES CINÉCOLES
  Future<List<String>> _fetchImagePalCin() async {
    try {
      List<String> imageUrl = await APIManager.fetchImageUrl([111], num);
      return imageUrl;
    } catch (error) {
      print('Erreur lors de la récupération de l\'URL de l\'image: $error');
      return [];
    }
  }

//PALMARES CINÉCOLES
  Future<List<Partcipation>> _fetchDataPCint() async {
    List<Partcipation> participations = [];

    try {
      List<String> awards =
          await APIManager.fetchParticipationAwards([206], num); //Participation
      List<String> films =
          await APIManager.fetchEditionFilms([206], num); //Participaton
      for (int i = 0; i < awards.length; i++) {
        Partcipation participation = Partcipation.empty();
        participation.setPrix(awards[i]);
        participation.setFilm(films[i]);
        participations.add(participation);
        setState(() {
          PCinParticipations = participations;
        });
      }
    } catch (error) {
      print('erreur: $error');
      return [];
    }

    return participations;
  }

//PALMARES CINÉCOLES
  Future<void> _fetchPCintParticipants() async {
    try {
      List<Participant> participants =
          await APIManager.fetchParticipants([206]); //paticipant
      if (participants != null && participants.isNotEmpty) {
        setState(() {
          PCinParticipants = participants;
        });
      } else {
        print('Aucun participant trouvé');
      }
    } catch (error) {
      print('Erreur lors de la récupération des participants : $error');
    }
  }

//hMMAGES
  Future<List<String>> _fetchImageThree() async {
    try {
      List<String> imageUrl = await APIManager.fetchImageUrl(
          [112, 113, 114, 115, 116, 117, 118], num);
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
          [207, 208, 209, 210, 211, 212, 213], num); //Participation
      List<String> films = await APIManager.fetchEditionFilms(
          [207, 208, 209, 210, 211, 212, 213], num); //Participaton
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
          [207, 208, 209, 210, 211, 212, 213]); //paticipant
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
          await APIManager.fetchImageUrl([119, 120, 121, 122, 123], num);
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
          [214, 215, 216, 217, 218], num); //Participation
      List<String> films = await APIManager.fetchEditionFilms(
          [214, 215, 216, 217, 218], num); //Participaton
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
      List<Participant> participants = await APIManager.fetchParticipants(
          [214, 215, 216, 217, 218]); //paticipant
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Palmares cinécoles',
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
              future: PalCinImage,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PCourt(
                    imageUrl: snapshot.data!,
                    participation: PCinParticipations,
                    participants: PCinParticipants,
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
