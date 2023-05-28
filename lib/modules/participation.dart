class Partcipation {
  //déclarer des variables non-nullable qui seront initialisées ultérieurement
  late int id;
  late int id_participant;
  late int num_edition;
  late String prix;
  late String film;
  late String role;

  Partcipation({
    required this.id,
    required this.id_participant,
    required this.num_edition,
    required this.prix,
    required this.film,
    required this.role,
  });

  Partcipation.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    id_participant = map['id_participant'];
    num_edition = map['num_edition'];

    prix = map['nom'];
    film = map['prenom'];
    role = map['pays'];
  }

  int get getId => id;
  int get getIdP => id_participant;
  int get getNum => num_edition;

  String get getPrix => prix;

  String get getFilm => film;

  String get getRole => role;

  set setId(int value) => id = value;
  set setIdP(int value) => id_participant = value;
  set setNum(int value) => num_edition = value;

  set setPrix(String value) => prix = value;

  set setFilm(String value) => film = value;

  set setRole(String value) => role = value;
}
