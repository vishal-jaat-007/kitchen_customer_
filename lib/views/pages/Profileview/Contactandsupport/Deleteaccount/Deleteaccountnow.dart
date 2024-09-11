import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/resources/primary_decorations.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/Divider/gradient_divider.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';

class Deleteaccountnow extends StatefulWidget {
  const Deleteaccountnow({super.key});

  @override
  State<Deleteaccountnow> createState() => _DeleteaccountnowState();
}

class _DeleteaccountnowState extends State<Deleteaccountnow> {
  var _Passwordvisibal = false; 
  final TextEditingController _pswrdcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.deletemyaccount.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(children: [
          Containerwidget(
              child: Column(
            children: [   
              Text(LanguageConstants.confirmproceed.tr,
                  style: styles.textthme.fs20_semibold),
              Gap(14),
              Text(LanguageConstants.enteryourlogininfomation.tr,
                  textAlign: TextAlign.center,
                  style: styles.textthme.fs14_regular),
              Gap(10),
              DividerWidget(isCenterGradient: true),
              Gap(10),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(LanguageConstants.enteryourpassword.tr,
                      textAlign: TextAlign.center,
                      style: styles.textthme.fs14_regular)),
              Gap(5),
              TextFormField(
                  controller: _pswrdcontroller,
                  obscureText: _Passwordvisibal,
                  decoration: PrimaryDecorations.primaryTextFieldDecoration
                      .copyWith(
                          prefixIcon: Icon(Icons.lock_outline_rounded,
                              color: controller.isDarkMode()
                                  ? styles.appcolors.whitecolor
                                  : styles.appcolors.black20,
                              size: 20),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _Passwordvisibal = !_Passwordvisibal;
                                });
                              },
                              child: Icon(
                                  _Passwordvisibal
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: controller.isDarkMode()
                                      ? styles.appcolors.whitecolor
                                      : styles.appcolors.black20,
                                  size: 20)),
                          hintText: "**********")),
              Gap(35),
              Row(
                children: [
                  Primarybtn(
                      radius: 100,
                      name: LanguageConstants.Cancel.tr,
                      foregroundColor: styles.appcolors.primarycolor,
                      borderclr: styles.appcolors.primaryColorLight,
                      backgroundColor: styles.appcolors.primaryColorLight,
                      onPressed: () {
                        Get.back();
                      },
                      isExpanded: true),
                  Gap(15),
                  Primarybtn(
                      name: LanguageConstants.deletenow.tr,
                      onPressed: () {},
                      radius: 100,
                      isExpanded: true)
                ],
              )
            ],
          ))
        ]),
      ),
    );
  }
}
