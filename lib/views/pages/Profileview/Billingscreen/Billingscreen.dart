import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/Divider/gradient_divider.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/pages/Profileview/Billingscreen/widget/Billingdetail_widget.dart';
import 'package:tiffin_service_customer/views/pages/Profileview/Billingscreen/widget/Columewidget.dart';
import 'package:tiffin_service_customer/views/pages/Profileview/Billingscreen/widget/Listtile.dart';

class Billingscreen extends StatelessWidget {
  const Billingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    return Scaffold(
        // backgroundColor: styles.appcolors.whitecolor,
        appBar: PrimaryAppBar(titleText: LanguageConstants.bill.tr),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: ListView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Containerwidget(
                    shadow: false,
                    child: Column(
                      children: [
                        Text("${LanguageConstants.billNo.tr}: 875648".tr,
                            style: styles.textthme.fs16_regular),
                        Gap(10),
                        DividerWidget(isCenterGradient: true),
                        Gap(10),
                        Text(
                            "${LanguageConstants.tiffinWalaSharedBill.tr}\n 04:30 PM",
                            textAlign: TextAlign.center,
                            style: styles.textthme.fs16_regular),
                        Gap(10),
                        Text("₹600.00",
                            style: styles.textthme.fs28_semibold.copyWith(
                                color: styles.appcolors.primarycolor)),
                      ],
                    )),
                Gap(15),
                Containerwidget(
                    shadow: false,
                    child: Column(children: [
                      Listtilewidget(
                          title: "Tiffin Wala",
                          time: "24-06-2024",
                          address: "B-677, Sector 14, Hisar",
                          image: styles.appimg.tiffinwala),
                      Gap(10),
                      DividerWidget(isCenterGradient: true),
                      Gap(10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(LanguageConstants.billDuration.tr,
                                style: styles.textthme.fs16_regular),
                            Text(LanguageConstants.weekly.tr,
                                style: styles.textthme.fs16_semibold)
                          ])
                    ])),

                Gap(15),
                Containerwidget(
                    shadow: false,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("15 days Meal Plan".tr,
                                    style: styles.textthme.fs16_semibold),
                                Text("Ongoing".tr,
                                    style: styles.textthme.fs16_semibold)
                              ]),
                          Gap(10),
                          Text("₹80/${LanguageConstants.meal.tr}",
                              style: styles.textthme.fs16_regular),
                          Gap(10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("07${LanguageConstants.meal.tr}".tr,
                                    style: styles.textthme.fs16_regular),
                                Text(LanguageConstants.completed.tr.tr,
                                    style: styles.textthme.fs16_semibold)
                              ])
                        ])),
                Gap(15),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(LanguageConstants.details.tr.tr,
                        style: styles.textthme.fs16_regular)),
                Gap(15),

                // ------DETAILS---------
                // ------BREAKFAST---------
                Containerwidget(
                    shadow: false,
                    child: Column(children: [
                      Billingdetails_widget(
                          Mealbreakfast: "Bill Breakout",
                          srno: LanguageConstants.srNo.tr,
                          qty: LanguageConstants.qty.tr,
                          Total: LanguageConstants.total.tr),
                    ])),

                Gap(15),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  subtotlewidget(
                      subtitle: LanguageConstants.tax.tr,
                      title: LanguageConstants.subTotal.tr),
                  Gap(15),
                  subtotlewidget(subtitle: ":", title: ":"),
                  Gap(15),
                  subtotlewidget(
                      subtitle: LanguageConstants.tax.tr,
                      title: LanguageConstants.subTotal.tr)
                ]),
                Gap(20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text("${LanguageConstants.totalBill.tr}: 600.00",
                            style: styles.textthme.fs16_regular),
                      ),
                      Primarybtn(
                          height: 10,
                          isExpanded: true,
                          name: LanguageConstants.payNow.tr,
                          onPressed: () {})
                    ]),
                Gap(10),
              ])
            ])));
  }
}
