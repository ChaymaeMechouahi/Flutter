class Edition {
  int numero;
  String dateDebut;
  String dateFin;
  String texte;
  String titre;

  Edition({
    required this.numero,
    required this.titre, 
    required this.texte,
    required this.dateDebut,
    required this.dateFin,
  });

  // Getters
  int get getNumero {
    return numero;
  }

  String get getdateDebut {
    return dateDebut;
  }

  String get getdateFin {
    return dateFin;
  }

  String get getTexte {
    return texte;
  }

  String get getTitre {
    return titre;
  }

  // Setters
  set setNumero(int value) {
    numero = value;
  }

  set setdateDebut(String value) {
    dateDebut = value;
  }

  set setdateFin(String value) {
    dateFin = value;
  }

  set setTexte(String value) {
    texte = value;
  }

  set setTitre(String value) {
    titre = value;
  }
}
