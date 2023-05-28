class Image {
  //déclarer des variables non-nullable qui seront initialisées ultérieurement
  late int id;
  late int num_edition;
  late String img;

  Image({
    required this.id,
    required this.num_edition,
    required this.img,
  });

  Image.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    num_edition = map['num_edition'];
    img = map['img'];
  }

  int get getId => id;

  int get getNumEdition => num_edition;

  String get getImg => img;

  set setId(int value) => id = value;

  set setNumero(int value) => num_edition = value;

  set setImg(String value) => img = value;
}
