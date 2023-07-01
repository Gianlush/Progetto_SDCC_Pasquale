class Book {

  int id;
  String name;
  String genre;
  String age;
  String author;



  Book({this.id, this.name, this.genre, this.age, this.author});

  factory Book.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    name = name.replaceAll("Ã", "à");
    return Book(
      id: json['id'],
      name: name,
      genre: json['genre'],
      age: json['age'],
      author: json['author'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'genre': genre,
    'age': age,
    'author':author,
  };

  @override
  String toString() {
    return name;
  }

  bool equals(Book book){
    return (name==book.name && author==book.author);
  }
}