import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SnackbarHelper {
  static void showErrorSnackbar(String message, {String title = "Error"}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showInfoSnackbar(String message, {String title = "Info"}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
