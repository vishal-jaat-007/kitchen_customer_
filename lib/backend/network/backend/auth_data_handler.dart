import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/backend/network/Exceptions/exceptions.dart';
import 'package:tiffin_service_customer/backend/network/repo/auth_repositry.dart';
import 'package:tiffin_service_customer/backend/network/repo/sharedPerf.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/view_model/controllers/auth/user_controller.dart';
import 'package:tiffin_service_customer/view_model/model/auth/UserModel.dart';

class AuthDataHandler {
  final _repo = AuthRepositry();
  final UserController _userController = Get.find<UserController>();

  Future<void> signup(
      {required Usermodel user, required String password}) async {
    try {
      final usersnapshot = await _repo.signup(user: user, password: password);
      _userController.setUser(usersnapshot);
      await SpData.setprafdata(SpData.userid, usersnapshot.uid);
      Get.toNamed(Routes.CompleteYourProfile, arguments: usersnapshot.toJson());
    } on AppExceptions catch (e) {
      throw e; // Rethrow to handle in UI
    } catch (e) {
      throw DefaultException(
          message: 'An unknown error occurred. Please try again later.');
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final usersnapshot = await _repo.login(email: email, password: password);
      _userController.setUser(usersnapshot);
      await SpData.setprafdata(SpData.userid, usersnapshot.uid);
      Get.offNamed(Routes.bottomnavigationbar);
    } on FirebaseAuthException catch (e) {
      // Handle Firebase specific exceptions
      if (e.code == 'user-not-found') {
        throw DefaultException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw DefaultException(
            message: 'Wrong password provided for that user.');
      } else {
        throw DefaultException(
            message: 'An unknown error occurred. Please try again later.');
      }
    } on AppExceptions catch (e) {
      throw e; // Rethrow to handle in UI
    } catch (e) {
      throw DefaultException(
          message: 'An unknown error occurred. Please try again later.');
    }
  }

  void logout() {
    SpData.removeprafdata(SpData.userid);
    FirebaseAuth.instance.signOut();
    _userController.setUser(Usermodel()); // Clear user data in the controller
  }

  Future<void> completeProfile({required Usermodel user}) async {
    // Add implementation if needed
  }
}
