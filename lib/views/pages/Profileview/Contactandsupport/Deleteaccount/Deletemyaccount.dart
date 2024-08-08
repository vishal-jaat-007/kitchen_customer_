import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/Divider/gradient_divider.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';

class Deletemyaccount extends StatelessWidget {
  Deletemyaccount({super.key});

  List<Map<String, dynamic>> proceeding = [
    {
      "key": LanguageConstants.dataloss.tr,
      "value": LanguageConstants.restoreyouraccount.tr
    },
    {
      "key": LanguageConstants.inablilitytorestore.tr,
      "value": LanguageConstants.wewont.tr
    },
    {
      "key": LanguageConstants.lossofaccess.tr,
      "value": LanguageConstants.associtedwithaccount.tr
    },
    {
      "key": LanguageConstants.recoveryprocess.tr,
      "value": LanguageConstants.changeyoumind.tr
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PrimaryAppBar(titleText: LanguageConstants.deletemyaccount.tr),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Containerwidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: Text(LanguageConstants.deleteyouraccount.tr,
                        style: styles.textthme.fs20_semibold,
                        textAlign: TextAlign.center)),
                Gap(10),
                DividerWidget(isCenterGradient: true),
                Gap(10),
                Text(
                  LanguageConstants.associtedcontent.tr,
                  style: styles.textthme.fs14_regular,
                  textAlign: TextAlign.center,
                ),
                Gap(10),
                Text(LanguageConstants.beforeproceeding.tr,
                    style: styles.textthme.fs14_regular),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                          proceeding.length,
                          (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("●"),
                                    Gap(5),
                                    Expanded(
                                        child: Text.rich(TextSpan(children: [
                                      TextSpan(
                                          text: proceeding[index]["key"],
                                          style: styles.textthme.fs14_semibold),
                                      TextSpan(
                                          text: proceeding[index]["value"],
                                          style: styles.textthme.fs14_regular),
                                    ])))
                                  ])))),
                ),
                Text(LanguageConstants.pleaseconfirmbelow.tr,
                    style: styles.textthme.fs14_regular),
                Gap(35),
                Row(
                  children: [
                    Primarybtn(
                        name: LanguageConstants.deletemyaccount.tr,
                        isExpanded: true,
                        onPressed: () {
                          Get.toNamed(Routes.deletenow);
                        }),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
