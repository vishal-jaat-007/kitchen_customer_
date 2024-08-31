import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/controllers/user_controller.dart';

class Apis {
  static final _firestore = FirebaseFirestore.instance;
  static final _firebaseStorage = FirebaseStorage.instance;

  // Collection References
  static CollectionReference userCollectionRef =
      _firestore.collection("Customer");

  // Document References
  static DocumentReference userDocumentRef(String id) =>
      userCollectionRef.doc(id);

  // Method to get saved addresses
  static Future<List<Map<String, dynamic>>> getSavedAddresses({
    required String userId,
  }) async {
    try {
      QuerySnapshot snapshot = await userDocumentRef(userId)
          .collection('addresses')
          .orderBy('createdAt', descending: true)
          .get();
      return snapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch addresses: $e');
    }
  }

  // Method to delete an address
  static Future<void> deleteAddress({
    required String userId,
    required String addressId,
  }) async {
    try {
      await userDocumentRef(userId)
          .collection('addresses')
          .doc(addressId)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete address: $e');
    }
  }

  // Other methods...

  // Method to add a new address
  static Future<void> addAddress({
    required String userId,
    required String houseNo,
    required String addressTitle,
    required String contactName,
    required String contactNumber,
    required double latitude,
    required double longitude,
  }) async {
    try {
      await userDocumentRef(userId).collection('addresses').add({
        'houseNo': houseNo,
        'addressTitle': addressTitle,
        'contactName': contactName,
        'contactNumber': contactNumber,
        'latitude': latitude,
        'longitude': longitude,
        'createdAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Failed to add address: $e');
    }
  }

  // Method to upload an image to Firebase Storage
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
    File? profileImage, // Add profileImage parameter
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
        'profileImage': profileImageUrl, // Store the image URL
        'createdAt': createdAt.toIso8601String(),
      });
    } catch (e) {
      throw Exception('Failed to add user: $e');
    }
  }

  // Method to update a user
  static Future<void> updateUser({
    required String id,
    required String username,
    required String email,
    required String dob,
    required String gender,
    File? profileImage,
  }) async {
    try {
      String? profileImageUrl;
      if (profileImage != null) {
        profileImageUrl = await uploadImageToFirebase(profileImage);
      }

      await userDocumentRef(id).update({
        'username': username,
        'dob': dob,
        'gender': gender,
        'profileImage': profileImageUrl,
        'updatedAt': DateTime.now().toIso8601String(),
      }).then((val) {
        var userController = Get.find<UserController>();

        userController.setUser(userController.user
            .copyWith(gender: gender, dob: dob, profileImage: profileImageUrl));

        print(userController.user.profileImage);
      });
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }
}
