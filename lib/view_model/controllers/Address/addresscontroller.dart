// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:tiffin_service_customer/view_model/controllers/auth/sharedpref.dart';
// import 'package:tiffin_service_customer/view_model/model/user/userdata.dart';

// class Addresscontroller extends ChangeNotifier {
//     final _firestore = FirebaseFirestore.instance;
//   dynamic _address;
//   addressmodel get addressdata => _address;
//   setaddressdata(addressmodel model) {
//     _address = model;
//     notifyListeners();
//   }
//   // -----
//   Future Addaddress(Map<String,dynamic> data)async{
//     final model= addressmodel.fromojson(data);
//   try {

//     final String? addressid= model.id;
//     await  _firestore.collection("address").doc(addressid);
//       _address = addressdata.copywith(id: addressid);
//     Sharedpref.setpref("address", addressid!);
//   } catch (e) {
    
//   }

//   }
  
// }