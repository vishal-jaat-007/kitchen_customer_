import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';

class GrandTotalDetailTile extends StatelessWidget {
  String title;
  String price;
  GrandTotalDetailTile({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    SingleTonClass styles = SingleTonClass.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: styles.textthme.fs16_regular.copyWith(
              color: controller.isDarkMode()
                  ? styles.appcolors.whitecolor
                  : styles.appcolors.blackcolor),
        ),
        Text(
          price,
          style: styles.textthme.fs16_regular.copyWith(
              color: controller.isDarkMode()
                  ? styles.appcolors.whitecolor
                  : styles.appcolors.blackcolor),
        )
      ],
    );
  }
}
