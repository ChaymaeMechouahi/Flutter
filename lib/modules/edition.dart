class Edition {
  //déclarer des variables non-nullable qui seront initialisées ultérieurement
  late int numero;
  late String titre;
  late String texte;
  late String dateDebut;
  late String dateFin;

  Edition({
    required this.numero,
    required this.titre,
    required this.texte,
    required this.dateDebut,
    required this.dateFin,
  });

  Edition.fromJson(Map<String, dynamic> map) {
    numero = map['num'];
    titre = map['titre'];
    texte = map['texte'];
    dateDebut = map['dateD'];
    dateFin = map['dateF'];
  }


  int get getNumero => numero;

  String get getTitre => titre;

  String get getTexte => texte;

  String get getDateDebut => dateDebut;

  String get getDateFin => dateFin;

  set setNumero(int value) => numero = value;

  set setTitre(String value) => titre = value;

  set setTexte(String value) => texte = value;

  set setDateDebut(String value) => dateDebut = value;

  set setDateFin(String value) => dateFin = value;
}
