import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/views/components/Divider/gradient_divider.dart';

class EixtAppDailog extends StatelessWidget {
  const EixtAppDailog({super.key});

  @override
  Widget build(BuildContext context) {
    ///-----------------Helpers-------------------------------
    var data = SingleTonClass.instance;
    return AlertDialog.adaptive(
      insetPadding: EdgeInsets.symmetric(horizontal: 40.w),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LanguageConstants.confirmexit.tr,
            style: data.textthme.fs20_medium
                .copyWith(color: data.appcolors.primarycolor),
          ),
          Gap(10),
          DividerWidget(isCenterGradient: true),
          Gap(10),
          Text(LanguageConstants.areyousureexit.tr,
              style: data.textthme.fs14_regular),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: data.appcolors.primaryColorLight,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      LanguageConstants.Cancel.tr,
                      style: data.textthme.fs14_medium
                          .copyWith(color: data.appcolors.primarycolor),
                    )),
              ),
              Gap(15),
              Expanded(
                child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: data.appcolors.primarycolor,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text(
                      LanguageConstants.yesexit.tr,
                      style: data.textthme.fs14_medium
                          .copyWith(color: data.appcolors.whitecolor),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
