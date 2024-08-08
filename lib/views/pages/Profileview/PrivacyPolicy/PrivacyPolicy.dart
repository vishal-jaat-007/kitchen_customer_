import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';

class Privacypolicy extends StatelessWidget {
  const Privacypolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.privacyPolicy.tr),
      body: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.w),
          child: Containerwidget(
              padding: EdgeInsets.all(20),
              child: ListView(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(LanguageConstants.privacy_policy_company_name.tr,
                      style: styles.textthme.fs16_semibold),
                  Gap(10),
                  Text(LanguageConstants.privacy_policy_text.tr,
                      style: styles.textthme.fs12_regular),
                  Gap(10),
                  Text(LanguageConstants.information_collection_and_use.tr,
                      style: styles.textthme.fs16_semibold),
                  Gap(10),
                  Text(LanguageConstants.information_collection_text.tr,
                      style: styles.textthme.fs12_regular),
                  Gap(10),
                  Text(LanguageConstants.log_data.tr,
                      style: styles.textthme.fs16_semibold),
                  Gap(10),
                  Text(LanguageConstants.log_data_text.tr.tr.tr,
                      style: styles.textthme.fs12_regular),
                  Gap(10),
                  Text(LanguageConstants.cookies.tr,
                      style: styles.textthme.fs16_semibold),
                  Gap(10),
                  Text(LanguageConstants.cookies_text.tr,
                      style: styles.textthme.fs12_regular),
                ])
              ]))),
    );
  }
}
