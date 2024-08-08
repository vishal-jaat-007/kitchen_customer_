import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';

class AppinfoScreen extends StatelessWidget {
  const AppinfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.Appinfo.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            Containerwidget(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LanguageConstants.tiffinservice.tr,
                    style: styles.textthme.fs20_semibold),
                Gap(10),
                Text(LanguageConstants.copyright.tr,
                    style: styles.textthme.fs14_regular),
                Gap(10),
                Text(LanguageConstants.milkmanmanger.tr,
                    style: styles.textthme.fs14_regular),
                Gap(14),
                Text(LanguageConstants.withintuitive.tr,
                    style: styles.textthme.fs14_regular),
                Gap(14),
                Text(LanguageConstants.contactus.tr,
                    style: styles.textthme.fs14_semibold),
                Gap(8),
                Text(LanguageConstants.forsupport.tr,
                    style: styles.textthme.fs14_regular),
                Gap(8),
                Row(children: [
                  Expanded(
                    child: Text("${LanguageConstants.email.tr}:",
                        style: styles.textthme.fs14_regular),
                  ),
                  Gap(15),
                  Expanded(
                    flex: 4,
                    child: Text("support${LanguageConstants.example.tr}",
                        style: styles.textthme.fs14_regular),
                  )
                ]),
                Gap(8),
                Row(children: [
                  Expanded(
                    child: Text(LanguageConstants.phone.tr,
                        style: styles.textthme.fs14_regular),
                  ),
                  Gap(15),
                  Expanded(
                      flex: 4,
                      child: Text("+91-9992223334",
                          style: styles.textthme.fs14_regular))
                ]),
                Gap(10),
                Align(
                    alignment: Alignment.center,
                    child: Text("${LanguageConstants.version.tr} 1.0.0",
                        style: styles.textthme.fs14_regular)),
                Gap(10),
                Row(
                  children: [
                    Primarybtn(
                        isExpanded: true,
                        name: LanguageConstants.checkforupdate.tr,
                        onPressed: () {}),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
