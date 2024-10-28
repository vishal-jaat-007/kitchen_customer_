import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/controllers/auth/user_controller.dart';

class Apis {
  static final _firestore = FirebaseFirestore.instance;
  static final _firebaseStorage = FirebaseStorage.instance;

  // Collection References
  static CollectionReference userCollectionRef =
      _firestore.collection("Customer");

  // Document References
  static DocumentReference userDocumentRef(String id) =>
      userCollectionRef.doc(id);


// ---------------- 

  static Future<String?> uploadImageToFirebase(File image) async {
    try {
      final storageRef = _firebaseStorage
          .ref()
          .child('profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = storageRef.putFile(image);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  // Method to add a new user
  static Future<void> addUser({
    required String username,
    required String email,
    required String dob,
    required String gender,
    required String phoneNumber,
    required DateTime createdAt,
    File? profileImage, 
  }) async {
    try {
      String? profileImageUrl;
      if (profileImage != null) {
        profileImageUrl = await uploadImageToFirebase(profileImage);
      }

      await userCollectionRef.add({
        'username': username.isNotEmpty ? username : null,
        'email': email.isNotEmpty ? email : null,
        'dob': dob.isNotEmpty ? dob : null,
        'gender': gender.isNotEmpty ? gender : null,
        'phoneNumber': phoneNumber.isNotEmpty ? phoneNumber : null,
        'profileImage': profileImageUrl,
        'createdAt': createdAt.toIso8601String(),
      });
    } catch (e) {
      throw Exception('Failed to add user: $e');
    }
  } 

  static Future<void> updateUser({
    required String id,
    required String username,
    required String email,
    required String dob,
    required String gender,
    File? profileImage,
  }) async {
    try {
      DocumentSnapshot userDoc = await userDocumentRef(id).get();
      if (!userDoc.exists) {
        throw Exception('User does not exist');
      }

      final data = userDoc.data() as Map<String, dynamic>?;

      String? existingProfileImageUrl = data?['profileImage'] as String?;

      String? profileImageUrl;
      if (profileImage != null) {
        profileImageUrl = await uploadImageToFirebase(profileImage);
      } else {
        profileImageUrl = existingProfileImageUrl;
      }

      // Update  user document
      await userDocumentRef(id).update({
        'username': username,
        'email': email,
        'dob': dob,
        'gender': gender,
        'profileImage': profileImageUrl,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      // Update the user controller with the new data
      var userController = Get.find<UserController>();
      userController.setUser(userController.user.copyWith(
        username: username,
        email: email,
        dob: dob,
        gender: gender,
        profileImage: profileImageUrl ?? existingProfileImageUrl,
      ));
    } catch (e) {
      print('Error updating user: $e');
      throw Exception('Failed to update user: $e');
    }
  }
}
