import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';

class Pinputwidget extends StatelessWidget {
  const Pinputwidget({super.key});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
final controller = Get.find<ThemeController>();
    return Pinput(
      onCompleted: (value) {
        Get.toNamed(Routes.CompleteYourProfile);
      },
      length: 6,
      followingPinTheme: PinTheme(
          height: 50,
          decoration: BoxDecoration(
              color:controller.isDarkMode()
                  ? styles.appcolors.darktheme_highlight
                  : styles.appcolors.lightbg,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color:controller.isDarkMode()
                      ? styles.appcolors.whitecolor.withOpacity(0.3)
                      : styles.appcolors.blackcolor.withOpacity(0.2)))),
      defaultPinTheme: PinTheme(
        textStyle: styles.textthme.fs20_medium.copyWith(
            color:controller.isDarkMode()
                ? styles.appcolors.whitecolor
                : styles.appcolors.primarycolor),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color:controller.isDarkMode()
                    ? styles.appcolors.whitecolor
                    : styles.appcolors.primarycolor)),
      ),
    );
  }
}
