import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/app_services.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/textrich/textrich_widget.dart';
import 'package:tiffin_service_customer/views/pages/auth/Loginview/widget/Pinputwidget.dart';

class Otpverfication extends StatelessWidget {
  const Otpverfication({super.key});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;

    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.otpVerification.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          shrinkWrap: true,
          children: [
            Gap(Appservices.getScreenHeight() * 0.1),
            Text("${LanguageConstants.verificationCodeSent.tr}\n+91-8708534070",
                textAlign: TextAlign.center,
                style: styles.textthme.fs16_regular),
            Gap(20),
            Column(children: [
              Image.asset(styles.appimg.otpverfication),
            ]),
            Gap(30),
            Pinputwidget(),
            Gap(20),
            Column(
              children: [
                TextrichWidget(
                    onPressed: () {},
                    subtitle: LanguageConstants.resendSms.tr,
                    title: LanguageConstants.didntGetOtp.tr),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      LanguageConstants.tryMoreOptions.tr,
                      style: styles.textthme.fs16_regular
                          .copyWith(color: styles.appcolors.primarycolor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
