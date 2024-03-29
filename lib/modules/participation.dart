class Partcipation {
  late int id;
  late int id_participant;
  late int num_edition;
  late String prix;
  late String film;
  late String role;
  Partcipation.empty() {
    prix = '';
    film = '';
    role = '';
  }

  Partcipation({
    required this.id,
    required this.id_participant,
    required this.num_edition,
    required this.prix,
    required this.film,
    required this.role,
  }) {}

  Partcipation.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    id_participant = map['id_participant'];
    num_edition = map['num_edition'];
    prix = map['prix'];
    film = map['film'];
    role = map['role'];
  }

  int get getId => id;
  int get getIdP => id_participant;
  int get getNum => num_edition;

  String get getPrix => prix;

  String get getFilm => film;

  String get getRole => role;

  set setId(int value) {
    id = value;
  }

  set setIdP(int value) {
    id_participant = value;
  }

  set setNum(int value) {
    num_edition = value;
  }

  set setRole(String value) {
    role = value;
  }

  void setFilm(String film) {
    film = film;
  }

  void setPrix(String award) {
    prix = award;
  }
}
