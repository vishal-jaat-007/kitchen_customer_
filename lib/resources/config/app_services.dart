import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/views/pages/auth/CompleteYourProfile/widget/complete_your_profile.dart';

class Appservices {
  static double getScreenHeight() => Get.height;
  static double getScreenWidth() => Get.width;

  static Widget addHeight(double height) => SizedBox(
        height: height.h,
      );

  static Widget addWidth(double width) => SizedBox(
        width: width.w,
      );

  static void pushto(BuildContext context, CompleteYourProfile completeYourProfile) {}
}
