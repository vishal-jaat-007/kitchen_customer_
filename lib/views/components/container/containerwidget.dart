import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';

class Containerwidget extends StatelessWidget {
  Widget child;
  bool shadow;
  bool showPadding;
  bool showborder;
  Color? borderclr;
  EdgeInsetsGeometry? padding;
  Containerwidget(
      {super.key,
      required this.child,
      this.shadow = true,
      this.showPadding = true,
      this.showborder = false,
      this.borderclr,
      this.padding});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();

    return Obx(() => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: showPadding
            ? (padding ?? EdgeInsets.symmetric(vertical: 15, horizontal: 10))
            : null,
        decoration: BoxDecoration(
            border: showborder
                ? Border.all(
                    color: borderclr == null
                        ? styles.appcolors.black20
                        : borderclr!)
                : null,
            borderRadius: BorderRadius.circular(10.r),
            color: controller.isDarkMode()
                ? styles.appcolors.darktheme_highlight
                : styles.appcolors.whitecolor,
            boxShadow: shadow
                ? [
                    BoxShadow(
                        color: styles.appcolors.black10,
                        blurRadius: 4,
                        spreadRadius: 1,
                        offset: Offset(0, 0))
                  ]
                : null),
        child: child));
  }
}
