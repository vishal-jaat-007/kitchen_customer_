import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/app_services.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/pages/dashboard/widget/like_star_widget.dart';

class BreakfastWidget extends StatelessWidget {
  final CategoryModel category;
  BreakfastWidget({super.key, required this.category});

  @override 
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.onetimeorder, arguments: category);
          },
          child: Container(
            margin: EdgeInsets.only(top: 15),
            width: Appservices.getScreenWidth() * 0.5,
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
                color: styles.appcolors.primarycolor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "₹70 /-",
                      style: styles.textthme.fs20_semibold
                          .copyWith(color: styles.appcolors.whitecolor),
                    ),
                  ],
                ),
                Gap(18.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          LanguageConstants.poha.tr,
                          style: styles.textthme.fs20_semibold
                              .copyWith(color: styles.appcolors.whitecolor),
                        ),
                        Gap(5),
                        Text(
                          "${LanguageConstants.soy.tr}${LanguageConstants.bellPaper.tr}${LanguageConstants.peanuts.tr}",
                          maxLines: 1,
                          style: styles.textthme.fs12_regular.copyWith(
                            color: styles.appcolors.whitecolor,
                          ),
                        ),
                        Gap(5),
                        LikeStarWidget(
                          showrating: true,
                          color: styles.appcolors.whitecolor,
                          iconSize: 18,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Image.asset(
          styles.appimg.pohaimage,
        ),
      ],
    );
  }
}
