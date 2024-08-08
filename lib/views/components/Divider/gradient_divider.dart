import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

import '../../../view_model/controllers/Theme Controller/theme_controller.dart';

class DividerWidget extends StatelessWidget {
  final bool isCenterGradient;
  const DividerWidget({super.key, this.isCenterGradient = false});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();
    return Obx(() => AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 1,
          decoration: BoxDecoration(
              gradient: controller.isDarkMode()
                  ? LinearGradient(colors: [
                      if (isCenterGradient)
                        styles.appcolors.whitecolor.withOpacity(0.05),
                      styles.appcolors.whitecolor.withOpacity(0.4),
                      styles.appcolors.whitecolor.withOpacity(0.05)
                    ])
                  : LinearGradient(colors: [
                      if (isCenterGradient)
                        styles.appcolors.grey.withOpacity(0.05),
                      styles.appcolors.black50,
                      styles.appcolors.grey.withOpacity(0.05)
                    ])),
        ));
  }
}
