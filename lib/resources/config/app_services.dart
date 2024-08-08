import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Appservices {
  static double getScreenHeight() => Get.height;
  static double getScreenWidth() => Get.width;

  static Widget addHeight(double height) => SizedBox(
        height: height.h,
      );

  static Widget addWidth(double width) => SizedBox(
        width: width.w,
      );
}
