import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/Validator/validators.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/Dilog/Profileeditdialog.dart';
import 'package:tiffin_service_customer/views/components/ImagePicker/Imagepicker.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/components/textfilled/Textfield.dart';
import 'package:tiffin_service_customer/views/pages/auth/CompleteYourProfile/widget/Dropdownwidget.dart';
import 'package:tiffin_service_customer/views/pages/auth/CompleteYourProfile/widget/showdatepicker.dart';

class Profileedit extends StatefulWidget {
  const Profileedit({super.key});

  @override
  State<Profileedit> createState() => _ProfileeditState();
}

class _ProfileeditState extends State<Profileedit> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  File? imagefile;
  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();
    return Scaffold(
        appBar: PrimaryAppBar(titleText: LanguageConstants.editProfile.tr),
        body: Form(
          key: _globalKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(children: [
              Containerwidget(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  shadow: false,
                  child: Center(
                      // -----STACK--
                      child: Stack(alignment: Alignment(0.9, 1), children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: imagefile == null
                            ? Image.asset(styles.appimg.Profileimg,
                                height: 134, width: 134, fit: BoxFit.cover)
                            : Image.file(imagefile!,
                                height: 134, width: 134, fit: BoxFit.cover)),
                    // -----IMAGE--
                    InkWell(
                        onTap: () async {
                          var result = await Get.bottomSheet(Image_Picker());

                          setState(() {
                            imagefile = result;
                          });
                        },
                        child: Container(
                            height: 38.h,
                            width: 38.h,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1.r,
                                      offset: Offset(0, 1))
                                ],
                                shape: BoxShape.circle,
                                color: styles.appcolors.whitecolor),
                            child: Icon(Icons.edit_outlined,
                                size: 25,
                                color: styles.appcolors.primarycolor)))
                    // ---textfield---
                  ]))),
              Gap(15),
              Column(children: [
                Containerwidget(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -----NAME--
                    Text(LanguageConstants.name.tr,
                        style: styles.textthme.fs16_regular.copyWith(
                            color: controller.isDarkMode()
                                ? styles.appcolors.whitecolor
                                : styles.appcolors.black50)),
                    Textfieldwidget(
                        validator: TextValidator(),
                        hinttext: LanguageConstants.enteryourname.tr),
                    Gap(10),

                    // -----MOBILE--
                    Text(LanguageConstants.mobile.tr,
                        style: styles.textthme.fs16_regular.copyWith(
                            color: controller.isDarkMode()
                                ? styles.appcolors.whitecolor
                                : styles.appcolors.black50)),
                    Textfieldwidget(hinttext: "8708534070", suffic: true),
                    Gap(10),
                    // -----EMAIL--
                    Text(LanguageConstants.email.tr,
                        style: styles.textthme.fs16_regular.copyWith(
                            color: controller.isDarkMode()
                                ? styles.appcolors.whitecolor
                                : styles.appcolors.black50)),
                    Textfieldwidget(
                      hinttext: LanguageConstants.Mail.tr,
                      suffic: true,
                    ),
                    Gap(30), // -----SHOW DATEPICKER--
                    Showdatepickerwidget(
                      hinttext: "DD/MM/YY".tr,
                    ),
                    Gap(30), // -----DROPDOWN--
                    GenderDropDownWidget()
                  ],
                )),
                Gap(15), // -----PRIMARY BTN--
                Row(children: [
                  Primarybtn(
                      isExpanded: true,
                      name: LanguageConstants.update_profile.tr,
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          return Profileeditdialog();
                        }
                        ;
                      }),
                ]),
                Gap(10)
              ])
            ]),
          ),
        ));
  }
}
