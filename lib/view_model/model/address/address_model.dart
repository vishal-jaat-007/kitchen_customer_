import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiffin_service_customer/view_model/model/models.dart';

class AddressModel {
  String? id;
  String? houseNo;
  String? addresstitle;
  String? contactName;
  String? contactNumber;
  GeoPoint? location;

  AddressModel({
    this.id,
    this.houseNo,
    this.addresstitle,
    this.contactName,
    this.contactNumber,
    this.location,
  });

  // Convert AddressModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'houseNo': houseNo ?? "",
      'addresstitle': addresstitle ?? "",
      'contactName': contactName ?? "",
      'contactNumber': contactNumber ?? "",
      'location': location, // Firestore handles GeoPoint serialization
    };
  }

  // Create AddressModel from a Map
  factory AddressModel.fromMap(Map<String, dynamic> map, String docId) {
    return AddressModel(
      id: docId,
      houseNo: map['houseNo'] ?? "",
      addresstitle: map['addresstitle'] ?? "",
      contactName: map['contactName'] ?? "",
      contactNumber: map['contactNumber'] ?? "",
      location:
          map['location'] is GeoPoint ? map['location'] : GeoPoint(0.0, 0.0),
    );
  }

  // Create AddressModel from Firestore Document
  factory AddressModel.fromFirestore(FirebaseResponseModel response) {
    return AddressModel.fromMap(response.data, response.docId);
  }

  AddressModel copyWith({
    String? id,
    String? houseNo,  
    String? addresstitle,
    String? contactName,
    String? contactNumber,
    GeoPoint? location,
  }) {
    return AddressModel(
      id: id ?? this.id,
      houseNo: houseNo ?? this.houseNo,
      addresstitle: addresstitle ?? this.addresstitle,
      contactName: contactName ?? this.contactName,
      contactNumber: contactNumber ?? this.contactNumber,
      location: location ?? this.location,
    );
  }
}
