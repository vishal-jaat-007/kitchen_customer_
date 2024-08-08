import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/app_services.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';

class OfferContainer extends StatelessWidget {
  const OfferContainer({super.key});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;

    return Container(
      width: Appservices.getScreenWidth() * 0.98,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: styles.appcolors.lightyellow,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    " 10% ${LanguageConstants.off.tr}",
                    style: styles.textthme.fs20_semibold
                        .copyWith(color: styles.appcolors.blackcolor),
                  ),
                  Gap(10),
                  Text(
                    LanguageConstants.availFirstOrder.tr,
                    maxLines: 2,
                    style: styles.textthme.fs12_regular
                        .copyWith(color: styles.appcolors.black60),
                  ),
                  Gap(5),
                  Primarybtn(
                    name: LanguageConstants.orderNow.tr,
                    height: 10,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Image.asset(
            // height: 100.h,
            width: 200.w,
            styles.appimg.noddless,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
