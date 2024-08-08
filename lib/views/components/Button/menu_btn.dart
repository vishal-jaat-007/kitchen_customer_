import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/pages/dashboard/home.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/subscription/widgets/date_range_picker.dart';

class MenuBtnwidget extends StatelessWidget {
  const MenuBtnwidget({super.key});

  @override
  Widget build(BuildContext context) {
      Rx<String> selectedmenu = LanguageConstants.breakfast.tr.obs;

    return    Row(
                  children: List.generate(Todaymenubtn.length, (index) {
                return Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Obx(() => TextButton(
                            onPressed: () {
                              selectedmenu(Todaymenubtn[index].btnname);
                            },
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 2.h),
                                visualDensity: VisualDensity.compact,
                                backgroundColor:
                                    selectedmenu == Todaymenubtn[index].btnname
                                        ? styles.appcolors.primarycolor
                                        : controller.isDarkMode()
                                            ? styles.appcolors.blackcolor
                                            : styles.appcolors.whitecolor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    side: BorderSide(
                                        color: styles.appcolors.primarycolor))),
                            child: Text(Todaymenubtn[index].btnname,
                                style: styles.textthme.fs14_medium.copyWith(
                                    color: selectedmenu ==
                                            Todaymenubtn[index].btnname
                                        ? styles.appcolors.whitecolor
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color))))));
              }));
  }
}