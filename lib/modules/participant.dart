class Edition {
  //déclarer des variables non-nullable qui seront initialisées ultérieurement
  late int id;
  late String nom;
  late String prenom;
  late String pays;

  Edition({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.pays,
  });

  Edition.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    nom = map['nom'];
    prenom = map['prenom'];
    pays = map['pays'];
  }


  int get getId => id;

  String get getNom => nom;

  String get getPrenom => prenom;

  String get getPays => pays;

  set setId(int value) => id = value;

  set setNom(String value) => nom = value;

  set setPrenom(String value) => prenom = value;

  set setPays(String value) => pays = value;
}
