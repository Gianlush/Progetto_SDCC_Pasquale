class User {
  int id;
  String name;
  String surname;
  String email;
  String password;
  bool admin;



  User({this.id, this.name, this.surname, this.email, this.password, this.admin=false});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      surname: json['surname'],
      password: json['password'],
      admin: json['admin'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'surname': surname,
    'email': email,
    'password': password,
    'admin': admin
  };

  @override
  String toString() {
    return "$name $surname";
  }

  bool equals(User user){
    return (email==user.email);
  }
}