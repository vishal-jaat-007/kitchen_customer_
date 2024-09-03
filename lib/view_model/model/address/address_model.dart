import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:tiffin_service_customer/view_model/model/firebase/firebaseResponsemode.dart';

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
      'location': location,
    };
  }

  // Create AddressModel from Firestore Document
  AddressModel.fromFirestore(FirebaseResponseModel json)
      : id = json.docId,
        houseNo = json.data['houseNo'] ?? "",
        addresstitle = json.data['addresstitle'] ?? "", 
        contactName = json.data['contactName'] ?? "",
        contactNumber = json.data['contactNumber'] ?? "",
        location = json.data['location'] ?? GeoPoint(0.0, 0.0);

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




