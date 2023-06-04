class Participant {
  late int id;
  late String nom;
  late String prenom;
  late String pays;

  Participant({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.pays,
  });

 factory Participant.fromJson(Map<String, dynamic> json) {
  return Participant(
    id: json['id'],
    nom: json['nom'],
    prenom: json['prenom'],
    pays: json['pays'],
  );
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