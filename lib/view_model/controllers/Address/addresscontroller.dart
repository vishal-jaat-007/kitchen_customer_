import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiffin_service_customer/class/firebase.dart';
import 'package:tiffin_service_customer/view_model/model/address/address_model.dart';

class AddressController extends GetxController {
  final _firebaseHandler = FirebaseResponseHandler();
  final _firestore = FirebaseFirestore.instance;

  RxList<AddressModel> addresses = <AddressModel>[].obs;

  Future<void> addAddress(Map<String, dynamic> data) async {
    try {
      final db = await _firebaseHandler.postData(
          _firestore.collection("Address"), data);

      final address = AddressModel.fromFirestore(db as FirebaseResponseModel);
      print(address.contactName);
      addresses.add(address);
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteaddress({required String uid}) async {
    try {
      final delete = await _firebaseHandler
          .deleteData(_firestore.collection("Address").doc(uid).delete());
      return delete;
    } catch (e) {
      print(e.toString());
    }
  }
}
