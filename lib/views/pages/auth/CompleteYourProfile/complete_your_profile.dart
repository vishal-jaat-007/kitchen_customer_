import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/Validator/validators.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/resources/utils/Apis/apis.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/ImagePicker/Imagepicker.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/components/textfilled/Textfield.dart';
import 'package:tiffin_service_customer/views/pages/auth/CompleteYourProfile/widget/Dropdownwidget.dart';
import 'package:tiffin_service_customer/views/pages/auth/CompleteYourProfile/widget/showdatepicker.dart';

class CompleteYourProfile extends StatefulWidget {
  CompleteYourProfile({super.key});

  @override
  State<CompleteYourProfile> createState() => _CompleteYourProfileState();
}

class _CompleteYourProfileState extends State<CompleteYourProfile> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  late TextEditingController _email;
  late TextEditingController _nameController;
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  bool loading = false;

  File? imagefile;
  late String userId;

  @override
  void initState() {
    super.initState();

    // Retrieve user data from arguments
    var args = Get.arguments as Map<String, dynamic>;

    userId = args['uid'] as String;
    _email = TextEditingController(text: args['email'] as String);
    _nameController = TextEditingController(text: args['username'] as String);
    _birthDateController.text = args['dob'] as String;
    _genderController.text = args['gender'] as String;
  }

  @override
  void dispose() {
    _email.dispose();
    _nameController.dispose();
    _birthDateController.dispose();
    _genderController.dispose();
    _phonenumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
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
                          child:
                              Stack(alignment: Alignment(0.9, 1.2), children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: imagefile == null
                                ? Image.asset(styles.appimg.Profileimg,
                                    height: 134, width: 134, fit: BoxFit.cover)
                                : Image.file(imagefile!,
                                    height: 134,
                                    width: 134,
                                    fit: BoxFit.cover)),
                        InkWell(
                            onTap: () async {
                              var result =
                                  await Get.bottomSheet(Image_Picker());
                              if (result != null) {
                                setState(() {
                                  imagefile = result;
                                });
                              }
                            },
                            child: Container(
                                height: 44.h,
                                width: 44.w,
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
                      ]))),
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
                            readOnly: true,
                            hinttext: LanguageConstants.enteryourname.tr,
                            validator: TextValidator()),
                        Gap(10),
                        Text(LanguageConstants.email.tr,
                            style: styles.textthme.fs16_regular.copyWith(
                                color: controller.isDarkMode()
                                    ? styles.appcolors.whitecolor
                                    : styles.appcolors.black50)),
                        Textfieldwidget(
                            controller: _email,
                            readOnly: true,
                            validator: EmailValidator(),
                            hinttext: LanguageConstants.Mail.tr),
                        Gap(20),
                        Showdatepickerwidget(
                            datecontroller: _birthDateController,
                            hinttext: "DD/MM/YY"),
                        Gap(20),
                            GenderDropDownWidget(
                          onGenderChanged: (val) {
                            _genderController.text = val ?? '';
                          },
                        )
                      ])),
                  Gap(15),
                  Primarybtn(
                      loading: loading,
                      name: LanguageConstants.register.tr,
                      onPressed: () async {
                        if (_globalKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          setState(() {
                            loading = true;
                          });

                          try {
                            await Apis.updateUser(
                              id: userId,
                              username: _nameController.text.trim(),
                              email: _email.text.trim(),
                              dob: _birthDateController.text.trim(),
                              gender: _genderController.text.trim(),
                              profileImage: imagefile,
                            );
                            Get.toNamed(Routes.bottomnavigationbar);
                          } catch (e) {
                            print(e.toString());
                          } finally {
                            setState(() {
                              loading = false;
                            });
                          }
                        }
                      })
                ]))));
  }
}
