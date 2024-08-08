import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';

class Profiletile extends StatelessWidget {
  String image, name;

  Function onPressed;
  Profiletile(
      {super.key,
      required this.image,
      required this.name,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();
    return Column(
      children: [
        ListTile(
          onTap: () {
            onPressed();
          },
          leading: SvgPicture.asset(
            image,
            height: 24,
            width: 24,
            fit: BoxFit.cover,
            // ignore: deprecated_member_use
            color: controller.isDarkMode()
                ? styles.appcolors.whitecolor
                : styles.appcolors.blackcolor,
          ),
          title: Text(
            name,
            style: styles.textthme.fs16_regular,
          ),
          trailing: Icon(Icons.arrow_forward_ios,
              size: 20, color: styles.appcolors.primarycolor),
        ),
      ],
    );
  }
}
