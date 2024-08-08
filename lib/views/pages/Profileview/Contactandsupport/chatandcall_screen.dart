import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Divider/gradient_divider.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/pages/Profileview/Contactandsupport/widget/Icontextbtn.dart';

class ChatandcallScreen extends StatelessWidget {
  const ChatandcallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.contactSupport),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Containerwidget(
                    shadow: false,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(LanguageConstants.deliverypartner.tr,
                              style: styles.textthme.fs14_regular),
                          Gap(18),
                          DividerWidget(isCenterGradient: true),
                          Gap(18),
                          Text(LanguageConstants.itemorder.tr,
                              style: styles.textthme.fs14_regular),
                          Gap(18),
                          DividerWidget(isCenterGradient: true),
                          Gap(18),
                          Text(LanguageConstants.paymentbilling.tr,
                              style: styles.textthme.fs14_regular),
                          Gap(18),
                          DividerWidget(isCenterGradient: true),
                          Gap(18),
                          Text(LanguageConstants.whereis_myorder.tr,
                              style: styles.textthme.fs14_regular),
                          Gap(18),
                          DividerWidget(isCenterGradient: true),
                          Gap(18),
                          Text(LanguageConstants.deliverypartner.tr,
                              style: styles.textthme.fs14_regular),
                          Gap(18),
                          DividerWidget(isCenterGradient: true),
                          Gap(18),
                          Text(LanguageConstants.deliverypartner.tr,
                              style: styles.textthme.fs14_regular),
                        ])),
              ],
            ),
            Row(children: [
              Expanded(
                  child: Icontextbtn(
                      onPressed: () {
                        Get.toNamed(Routes.Chatscreen);
                      },
                      icon: Icons.message,
                      title: LanguageConstants.Continuechat.tr)),
              Gap(20),
              Expanded(
                  child: Icontextbtn(
                      onPressed: () {},
                      textcolor: true,
                      icon: Icons.message,
                      title: LanguageConstants.Call.tr))
            ])
          ],
        ),
      ),
    );
  }
}
