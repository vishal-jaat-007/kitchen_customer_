import 'dart:io';

import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/model/user/userdata.dart';

class UserController extends GetxController {
  var _user = Usermodel().obs;
  Usermodel get user => _user.value;

  // Method to set user data
  void setUser(Usermodel userdata) {
    _user.value = userdata;
  }

  // Reactive loading state
  var _loading = false.obs;
  bool get loading => _loading.value;

  // Method to set loading state
  void setLoading(bool status) {
    _loading.value = status;
  }

  // Method to update profile image
  void updateProfileImage(File image) {
    _user.update((user) {
      if (user != null) {
        user.profileImage = image.path;
      }
    });
  }
}
