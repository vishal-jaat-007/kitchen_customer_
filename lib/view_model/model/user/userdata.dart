class Usermodel {
  String? id;
  String? email;
  String? name;
  Usermodel({this.id, this.name, this.email});

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "name": name,
      "email": email,
    };
  }

  Usermodel copywith(
      {String? id, String? name, String? email, String? password}) {
    return Usermodel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Usermodel.fromojson(Map<String, dynamic> json)
      : id = json["id"],
        email = json["email"],
        name = json["name"];
}
