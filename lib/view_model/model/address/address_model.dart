import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiffin_service_customer/view_model/controllers/firebaseresponse.dart/firebaseResponsemodel.dart';

class AddressModel {
  String? id;
  String? houseNo;
  String? addresstitle;
  String? contactName;
  String? contactNumber;
  GeoPoint? location;
  String? userId; 
  AddressModel({
    this.id,
    this.houseNo,
    this.addresstitle,
    this.contactName,
    this.contactNumber,
    this.location,
    this.userId,
  });

  // Convert AddressModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'houseNo': houseNo ?? "",
      'addresstitle': addresstitle ?? "",
      'contactName': contactName ?? "",
      'contactNumber': contactNumber ?? "",
      'location': location, // Firestore handles GeoPoint serialization
      'userId': userId ?? "", // Added userId to map
    };
  }

  // Create AddressModel from a Map
  static AddressModel fromMap(Map<String, dynamic> map, String docId) {
    return AddressModel(
      id: docId,
      houseNo: map['houseNo'] ?? "",
      addresstitle: map['addresstitle'] ?? "",
      contactName: map['contactName'] ?? "",
      contactNumber: map['contactNumber'] ?? "",
      location:
          map['location'] is GeoPoint ? map['location'] : GeoPoint(0.0, 0.0),
      userId: map['userId'], // Extract userId from map
    );
  }

  // Create AddressModel from Firestore Document
  static AddressModel fromFirestore(FirebaseResponseModel response) {
    return fromMap(response.data, response.docId);
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
      userId: userId ?? this.userId, 
    );
  }
}
