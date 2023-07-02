import 'dart:typed_data';

class MyFile {

  int id;
  String nome;
  String estensione;
  Uint8List bytes;
  String descrizione;



  MyFile({this.id, this.nome, this.descrizione, this.bytes, this.estensione});
  factory MyFile.fromJson(Map<String, dynamic> json) {
    return MyFile(
      id: json['id'],
      nome: json['nome'],
      estensione: json['estensione'],
      descrizione: json['descrizione'],
    );
  }

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'descrizione': descrizione,
    'estensione': estensione,
  };

  @override
  String toString() {
    return nome+"."+estensione;
  }

  bool equals(MyFile file){
    return (nome==file.nome && estensione==file.estensione);
  }
}