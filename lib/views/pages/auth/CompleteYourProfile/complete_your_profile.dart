import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/usercontroller/user_controller.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/ImagePicker/Imagepicker.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/components/textfilled/Textfield.dart';
import 'package:tiffin_service_customer/views/pages/auth/CompleteYourProfile/widget/Dropdownwidget.dart';

class CompleteYourProfile extends StatefulWidget {
  const CompleteYourProfile({super.key});

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  File? imagefile;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    final userController = Get.put(UserController());
    SingleTonClass styles = SingleTonClass.instance;

    return Scaffold(
      appBar:
          PrimaryAppBar(titleText: LanguageConstants.completeYourProfile.tr),
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(children: [
            Containerwidget(
              shadow: false,
              child: Center(
                child: Stack(
                  alignment: Alignment(0.9, 1.2),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.r), 
                      child: imagefile == null
                          ? Image.asset(styles.appimg.Profileimg,
                              height: 134, width: 134, fit: BoxFit.cover)
                          : Image.file(imagefile!,
                              height: 134, width: 134, fit: BoxFit.cover),
                    ),
                    InkWell(
                      onTap: () async {
                        var result = await Get.bottomSheet(Image_Picker());
                        setState(() {
                          imagefile = result;
                        });
                      },
                      child: Container(
                        height: 44.h,
                        width: 44.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.r,
                              offset: Offset(0, 1),
                            )
                          ],
                          shape: BoxShape.circle,
                          color: styles.appcolors.whitecolor,
                        ),
                        child: Icon(Icons.edit_outlined,
                            size: 25, color: styles.appcolors.primarycolor),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Gap(15),
            Containerwidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LanguageConstants.name.tr,
                      style: styles.textthme.fs16_regular.copyWith(
                          color: controller.isDarkMode()
                              ? styles.appcolors.whitecolor
                              : styles.appcolors.black50)),
                  Textfieldwidget(
                    controller: _nameController,
                    hinttext: LanguageConstants.enteryourname.tr,
                    // validator: TextValidator()
                  ),
                  Gap(10),
                  Text(LanguageConstants.phoneNumber.tr,
                      style: styles.textthme.fs16_regular.copyWith(
                          color: controller.isDarkMode()
                              ? styles.appcolors.whitecolor
                              : styles.appcolors.black30)),
                  Textfieldwidget(
                    controller: _password,
                    suffixIcon: Icons.lock,
                    hinttext: "+91 12345 12345",
                    readOnly: true,
                  ),
                  Gap(10),
                  Text(
                    LanguageConstants.email.tr,
                    style: styles.textthme.fs16_regular.copyWith(
                        color: controller.isDarkMode()
                            ? styles.appcolors.whitecolor
                            : styles.appcolors.black50),
                  ),
                  Textfieldwidget(
                    controller: _email,
                    // validator: EmailValidator(),
                    hinttext: LanguageConstants.Mail.tr,
                  ),
                  Gap(20),
                  // Showdatepickerwidget(
                  //   controller: _birthDateController,
                  //   hinttext: "DD/MM/YY",
                  // ),
                  Gap(20),
                  GenderDropDownWidget(),
                ],
              ),
            ),
            Gap(15),
            Primarybtn(
              name: LanguageConstants.register.tr,
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  userController.addUser(
                    name: _nameController.text.trim(),
                    email: _email.text.trim(),
                    phoneNumber: _password.text.trim(),
                    birthDate: _birthDateController.text.trim(),
                    gender: _genderController.text
                        .trim(), // Assuming you have a gender dropdown
                    profileImageUrl: imagefile != null
                        ? imagefile!.path
                        : null, // Handle image file upload if required
                  );
                  Get.toNamed(Routes.bottomnavigationbar);
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
