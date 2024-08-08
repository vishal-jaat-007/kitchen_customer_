import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';

class PrimaryDecorations {
  static SingleTonClass _styles = SingleTonClass.instance;
  static ThemeController get controller => Get.find<ThemeController>();
  static InputBorder _textFieldPrimaryBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
          color: controller.isDarkMode()
              ? _styles.appcolors.whitecolor.withOpacity(0.3)
              : _styles.appcolors.black20));

  static InputDecoration primaryTextFieldDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
      isDense: true,
      hintStyle: _styles.textthme.fs16_regular.copyWith(
          color: controller.isDarkMode()
              ? _styles.appcolors.whitecolor.withOpacity(0.3)
              : _styles.appcolors.black60),
      focusedBorder: _textFieldPrimaryBorder,
      enabledBorder: _textFieldPrimaryBorder,
      border: _textFieldPrimaryBorder);
}
