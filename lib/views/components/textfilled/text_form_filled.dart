import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/app_services.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';

class SearchTextField extends StatelessWidget {
  Function? ontap;
  bool? readOnly;
  bool shadow;

  String? tittle;
  SearchTextField(
      {super.key,
      required this.ontap,
      this.readOnly = true,
      this.tittle,
      this.shadow = false});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: shadow
              ? [
                  BoxShadow(
                      color: styles.appcolors.black10,
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: Offset(0, 0))
                ]
              : null),
      child: TextFormField(
        onTap: () {
          ontap!();
        },
        readOnly: readOnly!,
        decoration: InputDecoration(
            hintText: tittle == null
                ? "${LanguageConstants.searchForDishes}".tr
                : tittle,
            hintStyle: styles.textthme.fs14_regular.copyWith(
                color: controller.isDarkMode()
                    ? styles.appcolors.whitecolor
                    : styles.appcolors.blackcolor),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search,
                  size: 24,
                  color: styles.appcolors.primarycolor,
                ),
                SizedBox(
                  height: 24,
                  child: VerticalDivider(
                    color: styles.appcolors.primarycolor,
                  ),
                ),
                Icon(
                  Icons.mic,
                  size: 24,
                  color: styles.appcolors.primarycolor,
                ),
                Appservices.addWidth(10)
              ],
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: controller.isDarkMode()
                        ? styles.appcolors.darktheme_highlight
                        : styles.appcolors.whitecolor),
                borderRadius: BorderRadius.circular(10.r)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: controller.isDarkMode()
                        ? styles.appcolors.darktheme_highlight
                        : styles.appcolors.whitecolor),
                borderRadius: BorderRadius.circular(10.r)),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: controller.isDarkMode()
                        ? styles.appcolors.darktheme_highlight
                        : styles.appcolors.whitecolor),
                borderRadius: BorderRadius.circular(10.r)),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            fillColor: controller.isDarkMode()
                ? styles.appcolors.darktheme_highlight
                : styles.appcolors.whitecolor,
            filled: true),
      ),
    );
  }
}
