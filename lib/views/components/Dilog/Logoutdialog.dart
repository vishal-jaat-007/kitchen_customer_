import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/Divider/gradient_divider.dart';

import '../../../resources/i18n/translation_files.dart';

class Logoutdialog extends StatelessWidget {
  String title, subtitle, Buttonname;
  Function? onPressed;
  Logoutdialog(
      {super.key,
      required this.Buttonname,
      required this.subtitle,
      this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Column(
        children: [
          Text(title,
              style: styles.textthme.fs20_medium
                  .copyWith(color: styles.appcolors.primarycolor)),
          Gap(15),
          DividerWidget(isCenterGradient: true),
          Gap(15),
          Text(subtitle, style: styles.textthme.fs14_regular),
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
                  name: Buttonname,
                  onPressed: () {
                    onPressed!();
                  },
                  radius: 100,
                  isExpanded: true)
            ],
          )
        ],
      ),
    );
  }
}
