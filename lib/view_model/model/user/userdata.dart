class Usermodel {
  String uid;
  String email;
  String username;
  String gender;
  String dob;
  DateTime? createdAt;
  String profileImage; 

  Usermodel({
    this.uid = "",
    this.email = "",
    this.username = "",
    this.gender = "",
    this.dob = "",
    this.createdAt,
    this.profileImage = "", 
  });

  Usermodel.fromJson(Map<String, dynamic> json, this.uid)
      : email = json["email"] ?? "",
        username = json["username"] ?? "",
        gender = json["gender"] ?? "",
        dob = json["dob"] ?? "",
        createdAt = (json["createdAt"] != null)
            ? DateTime.tryParse(json["createdAt"])
            : null,
        profileImage = json["profileImage"] ?? ""; 

  Map<String, dynamic> tojson() => {
        "uid": uid,
        "email": email,
        "username": username,
        "gender": gender,
        "dob": dob,
        "createdAt": createdAt?.toIso8601String(),
        "profileImage": profileImage, 
      };

  Usermodel copyWith({
    String? uid,
    String? email,
    String? username,
    String? gender,
    String? dob,
    DateTime? createdAt,
    String? profileImage, 
  }) {
    return Usermodel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      createdAt: createdAt ?? this.createdAt,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
