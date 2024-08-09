import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/app_services.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/textfilled/Textfield.dart';
import 'package:tiffin_service_customer/views/components/textrich/textrich_widget.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/subscription/widgets/date_range_picker.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    TextEditingController _username = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();

    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              Gap(80),
              Column(
                children: [
                  Image.asset(
                    styles.appimg.dabbawala,
                    height: Appservices.getScreenHeight() * 0.25,
                  ),
                  Gap(10),
                  Row(children: [
                    Expanded(child: Divider()),
                    Gap(15),
                    Text("${LanguageConstants.signUp.tr}",
                        style: styles.textthme.fs16_regular),
                    Gap(10),
                    Expanded(child: Divider())
                  ]),
                  Gap(20),
                  // ---intlephinefield--
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Username",
                            style: styles.textthme.fs16_regular.copyWith(
                                color: controller.isDarkMode()
                                    ? styles.appcolors.whitecolor
                                    : styles.appcolors.black50)),
                        Gap(5),
                        Textfieldwidget(
                            controller: _username,
                            hinttext: LanguageConstants.enteryourname.tr),
                        Gap(10),
                        Text(LanguageConstants.email.tr,
                            style: styles.textthme.fs16_regular.copyWith(
                                color: controller.isDarkMode()
                                    ? styles.appcolors.whitecolor
                                    : styles.appcolors.black50)),
                        Gap(5),
                        Textfieldwidget(
                            controller: _email,
                            hinttext: LanguageConstants.Mail.tr),
                        Gap(10),
                        Text("Password",
                            style: styles.textthme.fs16_regular.copyWith(
                                color: controller.isDarkMode()
                                    ? styles.appcolors.whitecolor
                                    : styles.appcolors.black50)),
                        Gap(5),
                        Textfieldwidget(
                            controller: _password,
                            hinttext: LanguageConstants.enteryourpassword.tr)
                      ]),

                  // _Intlphonefield(),
                  Gap(25),
                  // ---Primary btn--
                  Row(children: [
                    Primarybtn(
                        name: LanguageConstants.signUp.tr,
                        onPressed: () {
                          if (_globalKey.currentState!.validate()) {
                            return Get.toNamed(Routes.Otpverfication);
                          }
                        },
                        isExpanded: true)
                  ]),
                  Gap(20),
                  TextrichWidget(
                      onPressed: () {
                        Get.toNamed(Routes.Loginview);
                      },
                      subtitle: LanguageConstants.logIn.tr,
                      title:
                          "${LanguageConstants.or.tr} ${LanguageConstants.continueText.tr} ${LanguageConstants.withText.tr} "),

                  Gap(10),
                  // --google,facebook--
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(styles.appicon.facebook)),
                    Gap(12),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(styles.appicon.google)),
                  ]),
                  Gap(22),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
