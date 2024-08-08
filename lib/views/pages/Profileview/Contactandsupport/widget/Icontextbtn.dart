import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';

class Icontextbtn extends StatelessWidget {
  String title;
  IconData icon;
  bool textcolor;
  Function onPressed;
  Icontextbtn(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed,
      this.textcolor = false});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    return TextButton.icon(
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(
                  color: controller.isDarkMode()
                      ? styles.appcolors.whitecolor.withOpacity(0.3)
                      : styles.appcolors.black20))),
      onPressed: () {
        onPressed();
      },
      label: Text(
        title,
        style: styles.textthme.fs12_regular.copyWith(
            color: textcolor == false
                ? styles.appcolors.primarycolor
                : styles.appcolors.green),
      ),
      icon: Icon(icon,
          size: 16,
          color: textcolor == false
              ? styles.appcolors.primarycolor
              : styles.appcolors.green),
    );
  }
}
