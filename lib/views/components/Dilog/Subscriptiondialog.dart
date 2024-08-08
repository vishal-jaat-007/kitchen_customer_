import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';

class Subscriptiondialog extends StatelessWidget {
  String details;
  Subscriptiondialog({super.key, required this.details});
  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;

    return AlertDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(styles.appicon.checkicon),
          Gap(10),
          Text("${LanguageConstants.cancellationSuccessful.tr}",
              style: styles.textthme.fs18_semibold),
          Gap(15),
          Text(details,
              style: styles.textthme.fs16_regular, textAlign: TextAlign.center),
          Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Primarybtn(
                name: LanguageConstants.home.tr,
                onPressed: () {
                  Get.offAllNamed(Routes.bottomnavigationbar);
                },
                isExpanded: true,
                radius: 100,
                borderclr: styles.appcolors.lightpink,
                backgroundColor: styles.appcolors.lightpink,
                foregroundColor: styles.appcolors.primarycolor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
