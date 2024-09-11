import 'package:tiffin_service_customer/view_model/model/firebase/firebaseResponsemode.dart';

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

  Usermodel.fromJson(FirebaseResponseModel json, this.uid)
      : email = json.data["email"] ?? "",
        username = json.data["username"] ?? "",
        gender = json.data["gender"] ?? "",
        dob = json.data["dob"] ?? "",
        createdAt = json.data["createdAt"] != null
            ? DateTime.tryParse(json.data["createdAt"])
            : null, 
        profileImage = json.data["profileImage"] ?? "";

  Map<String, dynamic> toJson() => {   
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


