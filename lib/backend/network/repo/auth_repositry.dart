import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiffin_service_customer/backend/network/Exceptions/exceptions.dart';
import 'package:tiffin_service_customer/backend/network/repo/baseservices.dart';
import 'package:tiffin_service_customer/backend/network/repo/sharedPerf.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/utils/Apis/apis.dart';
import 'package:tiffin_service_customer/view_model/controllers/auth/user_controller.dart';
import 'package:tiffin_service_customer/view_model/model/auth/UserModel.dart';
import 'package:tiffin_service_customer/view_model/model/firebase/firebaseResponsemode.dart';

class AuthRepositry extends Authentication {
  final _auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  @override
  Future<Usermodel> login(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final doc = await Apis.userDocumentRef(credential.user!.uid).get();

      if (doc.exists) {
        final userData =
            Usermodel.fromJson(FirebaseResponseModel.fromResponse(doc), doc.id);
        await SpData.setprafdata(SpData.userid, doc.id);
        return userData;
      } else {
        throw DefaultException(message: "User not found.");
      }
    } on FirebaseAuthException catch (e) {
      throw getResponseFirebase(e);
    } catch (e) {
      throw DefaultException(
          message: "An unknown error occurred: ${e.toString()}");
    }
  }

  @override
  Future<Usermodel> signup(
      {required Usermodel user, required String password}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: password);

      if (credential.user == null) {
        throw DefaultException(message: "Failed to get UserCredential.");
      }

      final userdata = user.copyWith(uid: credential.user!.uid);
      await Apis.userDocumentRef(userdata.uid).set(userdata.toJson());
      await SpData.setprafdata(SpData.userid, credential.user!.uid);
      return userdata;
    } on FirebaseAuthException catch (e) {
      throw getResponseFirebase(e);
    } catch (e) {
      throw DefaultException(
          message: "An unknown error occurred: ${e.toString()}");
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await SpData.removeprafdata(SpData.userid);
      await _auth.signOut();
      Get.offNamed(Routes.onboarding);
    } catch (e) {
      print("Logout Error: ${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text("Error logging out: ${e.toString()}"),
        ),
      );
    }
  }

  Future<void> relogin() async {
    final _usercontroller = Get.find<UserController>();
    final id = SpData.getprafdata(SpData.userid);

    if (id.isNotEmpty) {
      try {
        final data = await Apis.userDocumentRef(id).get();
        if (data.exists) {
          final userdata =
              Usermodel.fromJson(FirebaseResponseModel.fromResponse(data), id);
          _usercontroller.setUser(userdata);
          Get.offNamed(Routes.bottomnavigationbar);
        } else {
          print("User not found");
          Get.offNamed(Routes.Loginview);
        }
      } catch (e) {
        print("Relogin Error: ${e.toString()}");
        Get.offNamed(Routes.Loginview);
      }
    } else {
      Get.offNamed(Routes.Loginview);
    }
  }
}
