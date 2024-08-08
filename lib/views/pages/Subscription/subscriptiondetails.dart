import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/view_model/model/subscription_categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/Divider/gradient_divider.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';

class Subscriptiondetails extends StatelessWidget {
  SubscriptionCategeroyModel data;
  Subscriptiondetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
          titleText: LanguageConstants.Subscriptiondetails.tr,
          textcenter: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView(
          children: [
            GestureDetector(
                onTap: () {},
                child: Containerwidget(
                    shadow: false,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.title,
                                style: styles.textthme.fs16_semibold.copyWith(
                                    color: styles.appcolors.primarycolor),
                              ),
                              Text(
                                LanguageConstants.ongoing.tr,
                                style: styles.textthme.fs16_semibold.copyWith(
                                  color: styles.appcolors.primarycolor,
                                ),
                              )
                            ],
                          ),
                          Gap(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " ${data.days.toString()} ${LanguageConstants.fullMeals.tr}",
                                style: styles.textthme.fs16_regular.copyWith(
                                  color: styles.appcolors.primarycolor,
                                ),
                              ),
                              Text(
                                data.time.toString(),
                                style: styles.textthme.fs16_semibold.copyWith(
                                  color: styles.appcolors.primarycolor,
                                ),
                              ),
                            ],
                          ),
                          Gap(5),
                          Text(
                              " ₹ ${data.totalprice.toString()}/  ${LanguageConstants.meal.tr}",
                              style: styles.textthme.fs16_regular.copyWith(
                                  color: styles.appcolors.primarycolor)),
                          Gap(5),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " ${data.days.toString()} ${LanguageConstants.fullMeals.tr}",
                                  style: styles.textthme.fs16_regular.copyWith(
                                    color: styles.appcolors.primarycolor,
                                  ),
                                ),
                                Text(
                                    "${LanguageConstants.total.tr} ₹ ${data.totalprice.toString()} ",
                                    style: styles.textthme.fs16_semibold
                                        .copyWith(
                                            color:
                                                styles.appcolors.primarycolor))
                              ]),
                          Gap(10),
                          Row(
                            children: [
                              Expanded(child: DividerWidget()),
                              Text("+${LanguageConstants.addons.tr}",
                                  style: styles.textthme.fs16_regular),
                              Expanded(
                                  child: Transform.rotate(
                                      angle: pi, child: DividerWidget())),
                            ],
                          ),
                          Gap(10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: styles.appcolors.primarycolor),
                                    child: Text(LanguageConstants.dahi.tr,
                                        style: styles.textthme.fs16_regular
                                            .copyWith(
                                                color: styles
                                                    .appcolors.whitecolor))),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: styles.appcolors.primarycolor),
                                    child: Text(LanguageConstants.jeeraRayta.tr,
                                        style: styles.textthme.fs16_regular
                                            .copyWith(
                                                color: styles
                                                    .appcolors.whitecolor))),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 30),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: styles.appcolors.primarycolor),
                                    child: Text(LanguageConstants.roti.tr,
                                        style: styles.textthme.fs16_regular
                                            .copyWith(
                                                color: styles
                                                    .appcolors.whitecolor)))
                              ])
                        ]))),
            Gap(10),
            Text(LanguageConstants.subscriptionEffective.tr,
                style: styles.textthme.fs12_medium),
            Gap(15),
            // ---CANCEL SUBSCRIPTION BTN--
            Primarybtn(
                name: LanguageConstants.cancelSubscription.tr,
                onPressed: () {
                  Get.toNamed(Routes.SubscriptionCancellation, arguments: data);
                }),
          ],
        ),
      ),
    );
  }
}
