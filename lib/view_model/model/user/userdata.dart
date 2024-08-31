import 'package:cloud_firestore/cloud_firestore.dart';

class firebasemodel {
  String? id;
  String? email;
  String? name;
  String? phoneNumber;
  String? dob;

  firebasemodel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.dob,
  });

  firebasemodel.fromjson(FirebaseResponseModel json)
      : name = json.data["name"] ?? "",
        email = json.data["email"] ?? "",
        id = json.docId,
        phoneNumber = json.data["phonenumber"] ?? "",
        dob = json.data["dob"] ?? "";

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
