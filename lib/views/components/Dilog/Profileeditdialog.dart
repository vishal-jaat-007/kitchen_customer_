import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';

void Profileeditdialog() {
  SingleTonClass styles = SingleTonClass.instance;
  Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        title: Column(children: [
          Image.asset(styles.appicon.checkicon),
          Gap(5),
          Text(
            LanguageConstants.Profileupdate.tr,
            style: styles.textthme.fs18_semibold,
          ),
          Gap(10),
          Text(LanguageConstants.yourprofileupdate.tr,
              style: styles.textthme.fs16_regular, textAlign: TextAlign.center),
          Gap(15),
          Row(children: [
            Primarybtn(
                backgroundColor: styles.appcolors.primaryColorLight,
                borderclr: styles.appcolors.primaryColorLight,
                foregroundColor: styles.appcolors.primarycolor,
                isExpanded: true,
                name: LanguageConstants.Back,
                onPressed: () {
                  Get.back();
                },
                radius: 100)
          ])
        ]),
      ));
}
