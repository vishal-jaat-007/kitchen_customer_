import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Divider/gradient_divider.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/pages/Profileview/widget/profiletile.dart';

class Contactandsupport extends StatelessWidget {
  const Contactandsupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.contactSupport.tr),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              Containerwidget(
                  padding: EdgeInsets.all(4),
                  // shadow: false,
                  child: Column(children: [
                    Profiletile(
                        onPressed: () {
                          Get.toNamed(Routes.Chatscreen);
                        },
                        image: styles.appicon.chat,
                        name: "1800 123 1234"),
                    DividerWidget(isCenterGradient: true),
                    Profiletile(
                        onPressed: () {
                          Get.toNamed(Routes.ChatandcallScreen);
                        },
                        image: styles.appicon.whatsapp,
                        name: LanguageConstants.whatsappsupport.tr),
                    DividerWidget(isCenterGradient: true),
                    Profiletile(
                        onPressed: () {
                          Get.toNamed(Routes.deletemyaccount);
                        },
                        image: styles.appicon.deleteaccount,
                        name: LanguageConstants.deletemyaccount.tr),
                    DividerWidget(isCenterGradient: true),
                    Profiletile(
                        onPressed: () {
                          Get.toNamed(Routes.appinfo);
                        },
                        image: styles.appicon.appinfo,
                        name: LanguageConstants.Appinfo.tr),
                  ]))
            ],
          )),
    );
  }
}
