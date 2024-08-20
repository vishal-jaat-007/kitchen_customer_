import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/backend/network/backend/auth_data_handler.dart';
import 'package:tiffin_service_customer/resources/Validator/validators.dart';
import 'package:tiffin_service_customer/resources/config/app_services.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/model/user/userdata.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/textfilled/Textfield.dart';
import 'package:tiffin_service_customer/views/components/textrich/textrich_widget.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/subscription/widgets/date_range_picker.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool loading = false;

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;

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
                            validator: UsernameValidator(),
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
                            validator: EmailValidator(),
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
                            validator: PasswordValidator(),
                            controller: _password,
                            hinttext: LanguageConstants.enteryourpassword.tr)
                      ]),
                  Gap(25),
                  Row(children: [
                    Primarybtn(
                      loading: loading,
                      name: LanguageConstants.signUp.tr,
                      onPressed: () async {
                        if (_globalKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          try {
                            await AuthDataHandler().signup(
                                user: Usermodel(
                                    createdAt: DateTime.now(),
                                    username: _username.text,
                                    email: _email.text,
                                    dob: '',
                                    gender: ''),
                                password: _password.text);
                          } catch (e) {
                            Get.snackbar(
                              LanguageConstants.enteryourname.tr,
                              e.toString(),
                              backgroundColor: styles.appcolors.darkorange,
                              colorText:
                                  Colors.white, // Optional: Adjust text color
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } finally {
                            setState(() {
                              loading = false;
                            });
                          }
                        }
                      },
                      isExpanded: true,
                    ),
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
