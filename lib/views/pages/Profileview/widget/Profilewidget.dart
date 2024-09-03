import 'dart:io'; // Required for File
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/auth/user_controller.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:gap/gap.dart';

class Profilewidget extends StatelessWidget {
  Profilewidget({super.key});

  @override
  Widget build(BuildContext context) {
  
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();
    final user = Get.find<UserController>();

    // Determine if the profile image is a URL or local file
    Uri uri = Uri.parse(user.user.profileImage);
    bool isNetworkImage = uri.isAbsolute;

    return Stack(alignment: Alignment(0, -1.8), children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Containerwidget(
          child: Column(children: [
            Gap(55),
            Text(user.user.username, style: styles.textthme.fs18_medium),
            Gap(5),
            Text(user.user.email, style: styles.textthme.fs16_regular),
            Gap(20),
            Row(children: [
              Primarybtn(
                isExpanded: true,
                name: LanguageConstants.editProfile.tr,
                onPressed: () {
                  Get.toNamed(Routes.Profileeditscreen);
                },
                foregroundColor: styles.appcolors.primarycolor,
                backgroundColor: controller.isDarkMode()
                    ? styles.appcolors.darktheme_highlight
                    : styles.appcolors.whitecolor,
              )
            ]),
          ]),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage
            ? Image.network(user.user.profileImage,
                height: 100, width: 100, fit: BoxFit.cover)
            : Image.file(File(user.user.profileImage),
                height: 100, width: 100, fit: BoxFit.cover),
      ),
    ]);
  }
}
