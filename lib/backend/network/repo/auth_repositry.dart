import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/backend/network/Exceptions/exceptions.dart';
import 'package:tiffin_service_customer/backend/network/repo/baseservices.dart';
import 'package:tiffin_service_customer/backend/network/repo/sharedPerf.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/utils/Apis/apis.dart';
import 'package:tiffin_service_customer/view_model/controllers/auth/user_controller.dart';
import 'package:tiffin_service_customer/view_model/model/firebase/firebaseResponsemode.dart';
import 'package:tiffin_service_customer/view_model/model/auth/UserModel.dart';

class AuthRepositry extends Authentication {
  final _auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

// ------------------
  // -------------- LOGIN ----------
  // ---------------
  @override
  Future<Usermodel> login(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final doc = await Apis.userDocumentRef(credential.user!.uid).get();

      if (doc.exists) {
        final userData =
            Usermodel.fromJson(doc.data() as FirebaseResponseModel, doc.id);
        await SpData.setprafdata(SpData.userid, doc.id);
        return userData;
      } else {
        throw Exception("User not found");
      }
    } on FirebaseAuthException catch (e) {
      final error = getResponseFirebase(e);
      throw SnackBar(
          backgroundColor: Colors.black, content: Text(error.toString()));
    }
  }
  // ------------------
  // -------------- SIGNUP----------
  // ---------------

  @override
  Future<Usermodel> signup(
      {required Usermodel user, required String password}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: user.email, password: password);

      if (credential.user == null) {
        throw Exception("Failed to get UserCredential");
      }

      final userdata = user.copyWith(uid: credential.user!.uid);

      await Apis.userDocumentRef(userdata.uid).set(userdata.tojson());
      await SpData.setprafdata(SpData.userid, credential.user!.uid);
      return userdata;
    } catch (e) {
      if (e is FirebaseAuthException) {
        final error = getResponseFirebase(e);
        throw SnackBar(
            backgroundColor: Colors.black, content: Text(error.toString()));
      }
      rethrow;
    }
  }

// ------------------
  // -------------- LOGOUT ----------
  // ---------------
  logout(BuildContext context) async {
    await SpData.removeprafdata(SpData.userid);
    _auth.signOut().then(
          (value) => Get.toNamed(Routes.onboarding),
        );
  }

  // ------------------
  // -------------- RELOGIN----------
  // ---------------

  Relogin() async {
    final _usercontroller = Get.find<UserController>();

    final id = SpData.getprafdata(SpData.userid);

    if (id.isNotEmpty) {
      final data = await Apis.userDocumentRef(id).get();
      if (data.exists) {
        final userdata =
            Usermodel.fromJson(FirebaseResponseModel.fromResponse(data), id);
        _usercontroller.setUser(userdata);
      } else {
        print("user not found");
      }

      Get.toNamed(Routes.bottomnavigationbar);
    } else {
      Get.toNamed(Routes.Loginview);
    }
  }
}
