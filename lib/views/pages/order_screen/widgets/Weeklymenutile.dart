import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';

class Weeklymenutile extends StatelessWidget {
  String days;

  Weeklymenutile({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    return Containerwidget(
        shadow: true,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(days,
              style: styles.textthme.fs16_semibold
                  .copyWith(color: styles.appcolors.primarycolor)),
          Gap(7),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: Text(LanguageConstants.breakfast.tr,
                    style: styles.textthme.fs16_semibold,
                    textAlign: TextAlign.center)),
            Gap(20),
            Expanded(
                child: Text(LanguageConstants.lunch.tr,
                    textAlign: TextAlign.center,
                    style: styles.textthme.fs16_semibold)),
            Gap(20),
            Expanded(
                child: Text(LanguageConstants.dinner.tr,
                    textAlign: TextAlign.center,
                    style: styles.textthme.fs16_semibold))
          ]),
          
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("4 Roti, 2 Sabji, 1 Curd",
                        style: styles.textthme.fs16_regular,
                        textAlign: TextAlign.center))),
            Gap(20),
            Expanded(
                child: Text("4 Roti, 2 Sabji, 1 Curd",
                    textAlign: TextAlign.center,
                    style: styles.textthme.fs16_regular)),
            Gap(20),
            Expanded(
                child: Text("4 Roti, 2 Sabji, 1 Curd",
                    textAlign: TextAlign.center,
                    style: styles.textthme.fs16_regular))
          ])
        ]));
  }
}
