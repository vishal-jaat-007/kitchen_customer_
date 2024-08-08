import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';

class TitleBar extends StatelessWidget {
  String title;

  TitleBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();

    return Row(
      children: [
        Text(
          title,
          style: styles.textthme.fs16_medium.copyWith(
              color: controller.isDarkMode()
                  ? styles.appcolors.whitecolor
                  : styles.appcolors.blackcolor)
        ),
        Gap(15),
        Expanded(
            child: Container(
          height: 1,
          decoration: BoxDecoration(
              gradient: controller.isDarkMode()
                  ? LinearGradient(colors: [
                      styles.appcolors.whitecolor,
                      styles.appcolors.whitecolor.withOpacity(0.3)
                    ])
                  : LinearGradient(colors: [
                      styles.appcolors.black50,
                      styles.appcolors.grey.withOpacity(0.05)
                    ])),
        )),
      ],
    );
  }
}
