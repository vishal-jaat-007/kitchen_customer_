import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String? id;
  String houseNo;
  String buildingName;
  String contactName;
  String contactNumber;
  GeoPoint? location; // Assuming you use GeoPoint for location coordinates

  AddressModel({
    this.id,
    required this.houseNo,
    required this.buildingName,
    required this.contactName,
    required this.contactNumber,
     this.location,
  });

  // Convert AddressModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'houseNo': houseNo,
      'buildingName': buildingName,
      'contactName': contactName, 
      'contactNumber': contactNumber,
      'location': location,
    };
  }

  // Create AddressModel from Map
  factory AddressModel.fromMap(String id, Map<String, dynamic> map) {
    return AddressModel(
      id: id,
      houseNo: map['houseNo'] ?? '',
      buildingName: map['buildingName'] ?? '',
      contactName: map['contactName'] ?? '',
      contactNumber: map['contactNumber'] ?? '',
      location: map['location'] ?? GeoPoint(0.0, 0.0),
    );
  }
}
