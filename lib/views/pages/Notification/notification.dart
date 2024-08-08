import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Divider/gradient_divider.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';

/// *******  Notification Screen   *********** ///
class NotificationView extends StatelessWidget {
  NotificationView({super.key});
  SingleTonClass data = SingleTonClass.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.notification.tr),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Transform.rotate(angle: (pi), child: DividerWidget()),
                ),
                Gap(10),
                Text(
                  LanguageConstants.today.tr,
                  style: data.textthme.fs16_regular,
                ),
                Gap(10),
                Expanded(
                  child: DividerWidget(),
                ),
              ],
            ),
            Gap(20),
            Flexible(
              child: Containerwidget(
                shadow: false,
                child: ListView.separated(
                    itemBuilder: (context, i) =>
                        Notificationwidget(styles: data),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Gap(10),
                    itemCount: 2),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class Notificationwidget extends StatelessWidget {
  Notificationwidget({
    super.key,
    required this.styles,
  });

  SingleTonClass styles = SingleTonClass.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: styles.appcolors.black20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: styles.appcolors.primarycolor),
            child: Image.asset(
              styles.appimg.notification_img,
              height: 20.w,
              width: 20.w,
            ),
          ),
          Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Order Arriving",
                        style: styles.textthme.fs16_regular,
                      ),
                    ),
                    Text(
                      "05 min ago",
                      style: styles.textthme.fs12_regular,
                    ),
                  ],
                ),
                Text(
                  "Your Upcoming order will be arrive on your location at 01:00 PM.",
                  style: styles.textthme.fs14_regular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
