class User {
  int id;
  String name;
  String surname;
  String email;
  String password;



  User({this.id, this.name, this.surname, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      surname: json['surname'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'surname': surname,
    'email': email,
    'password': password,
  };

  @override
  String toString() {
    return "$name $surname";
  }

  bool equals(User user){
    return (email==user.email);
  }
}