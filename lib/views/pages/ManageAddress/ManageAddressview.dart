import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Divider/dotted_divider.dart';
import 'package:tiffin_service_customer/views/components/Divider/gradient_divider.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/components/dilog/Logoutdialog.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/subscription/widgets/date_range_picker.dart';

class Manageaddress extends StatelessWidget {
  const Manageaddress({super.key});

  @override
  Widget build(BuildContext context) {
    ///Helpers

    return Scaffold(
      appBar: PrimaryAppBar(
        titleText: LanguageConstants.manageAddress,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Containerwidget(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                shadow: true,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.AddAdrees);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      leading: Icon(Icons.add_circle_outline,
                          size: 27, color: styles.appcolors.primarycolor),
                      title: Text(
                        LanguageConstants.add_address.tr,
                        style: styles.textthme.fs16_regular
                            .copyWith(color: styles.appcolors.primarycolor),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_sharp,
                          color: styles.appcolors.black60),
                    ),
                    DottedDivider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      leading: Icon(Icons.my_location_rounded,
                          color: styles.appcolors.primarycolor, size: 27),
                      title: Text(
                        LanguageConstants.add_address.tr,
                        style: styles.textthme.fs16_regular
                            .copyWith(color: styles.appcolors.primarycolor),
                      ),
                      subtitle: Text("Rishi Nagar, Hisar",
                          style: styles.textthme.fs16_regular),
                    ),
                  ],
                )),
            Gap(15),
            Row(children: [
              Expanded(child: DividerWidget()),
              Gap(5),
              Text(
                LanguageConstants.saved_address.tr,
                style: styles.textthme.fs12_regular,
              ),
              Gap(5),
              Expanded(
                  child: Transform.rotate(angle: pi, child: DividerWidget()))
            ]),
            Gap(15),
            Containerwidget(
                shadow: true,
                child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 10,
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Icon(Icons.home_outlined, size: 30)],
                    ),
                    title: Text(LanguageConstants.Kitchen.tr,
                        style: styles.textthme.fs16_regular),
                    subtitle: Text(
                        "House number 42,  Sharma gali, Shastri Nagar, hisar",
                        style: styles.textthme.fs14_regular.copyWith(
                            color: controller.isDarkMode()
                                ? styles.appcolors.whitecolor
                                : styles.appcolors.black60)),
                    trailing: Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.dialog(Logoutdialog(
                                  Buttonname: LanguageConstants.YesDelete.tr,
                                  subtitle: LanguageConstants
                                      .AreyousureyouwanttoDelete.tr,
                                  title: LanguageConstants.Delete.tr));
                            },
                            child: Icon(Icons.delete_outline_outlined,
                                color: styles.appcolors.primarycolor)),
                        Gap(5.h),
                        GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.edit_outlined,
                                color: styles.appcolors.primarycolor))
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
