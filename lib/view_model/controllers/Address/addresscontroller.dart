import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/model/address/address_model.dart';

class AddressController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<AddressModel> addresses = <AddressModel>[].obs;

  Future<void> addAddress(Map<String, dynamic> data) async {
    try {
      final docRef = await _firestore.collection("Address").add(data);
      final address = AddressModel.fromMap(data, docRef.id);
      addresses.add(address);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateAddress(String id, Map<String, dynamic> data) async {
    try {
      await _firestore.collection("Address").doc(id).update(data);
      // Optionally, you can refresh the local list of addresses
      final updatedAddress = AddressModel.fromMap(data, id);
      final index = addresses.indexWhere((address) => address.id == id);
      if (index != -1) {
        addresses[index] = updatedAddress;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteAddress(String id) async {
    try {
      await _firestore.collection("Address").doc(id).delete();
      addresses.removeWhere((address) => address.id == id);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<AddressModel?> getAddressById(String id) async {
    try {
      final doc = await _firestore.collection("Address").doc(id).get();
      if (doc.exists) {
        return AddressModel.fromMap(doc.data() ?? {}, doc.id);
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<List<AddressModel>> getAllAddresses() async {
    try {
      final snapshot = await _firestore.collection("Address").get();
      return snapshot.docs.map((doc) {
        return AddressModel.fromMap(doc.data(), doc.id);
      }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
