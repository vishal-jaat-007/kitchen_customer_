import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';

import '../../../../singletonClasses/singleton.dart';

class Logoutcontainer extends StatelessWidget {
  const Logoutcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    return Container(
      height: 216,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Gap(30),
            Text(LanguageConstants.logout.tr,
                style: styles.textthme.fs20_medium
                    .copyWith(color: styles.appcolors.primarycolor)),
            Gap(15),
            Container(
                height: 1,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  styles.appcolors.grey.withOpacity(0.05),
                  styles.appcolors.black10,
                  styles.appcolors.grey.withOpacity(0.05)
                ]))),
            Gap(15),
            Text(LanguageConstants.logout_confirmation.tr,
                style: styles.textthme.fs14_regular),
            Gap(15),
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
                    name: LanguageConstants.yes_logout.tr,
                    onPressed: () {},
                    radius: 100,
                    isExpanded: true)
              ],
            )
          ],
        ),
      ),
    );
  }
}
