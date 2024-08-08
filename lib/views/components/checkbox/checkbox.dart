import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';

class CustomCheckboxListTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?) onChanged;

  CustomCheckboxListTile({
    Key? key,
    required this.value,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: value
              ? styles.appcolors.primarycolor
              : styles.appcolors.blackcolor,
          value: value,
          onChanged: onChanged,
        ),
        Flexible(
          child: Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: styles.textthme.fs14_regular.copyWith(
                color: value
                    ? styles.appcolors.primarycolor
                    : controller.isDarkMode()
                        ? styles.appcolors.whitecolor
                        : styles.appcolors.blackcolor,
              )),
        ),
      ],
    );
  }
}
