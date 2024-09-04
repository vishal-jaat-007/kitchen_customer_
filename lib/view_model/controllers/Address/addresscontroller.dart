import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/model/address/address_model.dart';

class AddressController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<AddressModel> addresses = <AddressModel>[].obs;

  Future<void> addOrUpdateAddress(AddressModel address) async {
    try {
      if (address.id.isEmpty) {
        // Add new address
        final docRef =
            await _firestore.collection("Address").add(address.toMap());
        final newAddress = address.copyWith(id: docRef.id);
        addresses.add(newAddress);
      } else {
        // Update existing address
        await _firestore
            .collection("Address")
            .doc(address.id)
            .update(address.toMap());
        final index = addresses.indexWhere((addr) => addr.id == address.id);
        if (index != -1) {
          addresses[index] = address;
        }
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
