import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

void coupondilog() {
  SingleTonClass styles = SingleTonClass.instance;
  Get.dialog(AlertDialog(
    title: Column(children: [
      Image.asset(styles.appicon.checkicon),
      Gap(5),
      Text(
        "${LanguageConstants.congratulations.tr}",
        style: styles.textthme.fs18_semibold,
      ),
      Gap(10),
      Text(
          "${LanguageConstants.couponApplied.tr}₹75 ${LanguageConstants.onThisOrder.tr}",
          style: styles.textthme.fs16_regular,
          textAlign: TextAlign.center),
      Gap(15),
      Image.asset(styles.appimg.conratulations)
    ]),
  ));
}
