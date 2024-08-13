import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser({
    required String name,
    required String email,
    required String phoneNumber,
    required String birthDate,
    required String gender,
    String? profileImageUrl,
  }) async {
    try {
      await _firestore.collection("Customer").add({
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "birthDate": birthDate,
        "gender": gender,
        "profileImageUrl": profileImageUrl,
        "createdAt": FieldValue.serverTimestamp(),
      });
      Get.snackbar('Success', 'Profile created successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
