class Dictionary {
  int id;
  String word;
  String description;

  // Constructor ini memungkinkan anda untuk
  // Membuat class beserta isinya sekaligus
  Dictionary({this.id, this.word, this.description});

  // Fungsi untuk menerima dari format Map
  Dictionary.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.word = map['word'];
    this.description = map['description'];
  }

  // Fungsi untuk return ke format Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'description': description,
    };
  }

  // Fungsi konversi dari json ke entity
  static Dictionary fromJson(json) {
    var object = new Dictionary();
    object.id = int.parse(json['id']);
    object.word = json['word'];
    object.description = json['description'];

    return object;
  }
}
