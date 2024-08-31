import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AddressModel {
  String? id;
  String? houseNo;
  String? buildingName;
  String? contactName;
  String? contactNumber;
  GeoPoint? location; 

  AddressModel({
    this.id,
    this.houseNo,
    this.buildingName,
    this.contactName,
    this.contactNumber,
    this.location,
  });
 
  // Convert AddressModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return { 
      'houseNo': houseNo ?? "",                                                               
      'buildingName': buildingName ?? "",
      'contactName': contactName ?? "",
      'contactNumber': contactNumber ?? "",
      'location': location,
    };
  }

  // Create AddressModel from Firestore Document
  AddressModel.fromFirestore(FirebaseResponseModel json)
      : id = json.docId,
        houseNo = json.data['houseNo'] ?? "",
        buildingName = json.data['buildingName'] ?? "", 
        contactName = json.data['contactName'] ?? "",
        contactNumber = json.data['contactNumber'] ?? "",
        location = json.data['location'] ?? GeoPoint(0.0, 0.0);
}

class FirebaseResponseModel {
  Map<String, dynamic> data;
  String docId;

  FirebaseResponseModel(this.data, this.docId);

  FirebaseResponseModel.fromResponse(QueryDocumentSnapshot snapshot)
      : data = snapshot.data() as Map<String, dynamic>,
        docId = snapshot.id;
}

class AddressController extends ChangeNotifier {
  List<AddressModel> _addresses = [];

  // Add other functionalities for managing addresses here
}
