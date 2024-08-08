import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/pages/dashboard/widget/like_star_widget.dart';

class CategoryContainer extends StatelessWidget {
  final CategoryModel category;
  const CategoryContainer({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();

    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.onetimeorder, arguments: category);
      },
      child: Container(
        decoration: BoxDecoration(
            color: controller.isDarkMode()
                ? styles.appcolors.darktheme_highlight
                : styles.appcolors.whitecolor,
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.r), bottom: Radius.circular(20.r)),
                child: Image.asset(category.image)),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category.foodtype.tr,
                        style: styles.textthme.fs20_semibold,
                      ),
                    ],
                  ),
                  Gap(5),
                  Text(
                    category.foodname.tr,
                    style: styles.textthme.fs14_regular.copyWith(
                        color: controller.isDarkMode()
                            ? styles.appcolors.whitecolor.withOpacity(0.4)
                            : styles.appcolors.black60),
                  ),
                  Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LikeStarWidget(
                        color: styles.appcolors.primarycolor,
                      ),
                      Row(
                        children: [
                          Text(
                            LanguageConstants.startingFrom.tr,
                            style: styles.textthme.fs12_regular,
                          ),
                          Gap(10),
                          Text(
                            "₹${category.price}/-".tr,
                            style: styles.textthme.fs20_semibold
                                .copyWith(color: styles.appcolors.primarycolor),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
