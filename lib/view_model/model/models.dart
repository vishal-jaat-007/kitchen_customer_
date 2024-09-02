import 'package:cloud_firestore/cloud_firestore.dart';

class usermodel {
  String? id;
  String? email;
  String? name;
  String? phoneNumber;
  String? dob;

  usermodel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.dob,
  });

  usermodel.fromjson(FirebaseResponseModel map)
      :id = map.docId, 
      name = map.data["name"] ?? "",
        email = map.data["email"] ?? "",
        
        phoneNumber = map.data["phonenumber"] ?? "",
        dob = map.data["dob"] ?? "";

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phonenumber": phoneNumber,
      "dob": dob,
    };
  }
}

class FirebaseResponseModel {
  Map<String, dynamic> data;
  String docId;

  FirebaseResponseModel(this.data, this.docId);

  FirebaseResponseModel.fromResponse(DocumentSnapshot snapshot)
      : data = snapshot.data() as Map<String, dynamic>,
        docId = snapshot.id;
}
