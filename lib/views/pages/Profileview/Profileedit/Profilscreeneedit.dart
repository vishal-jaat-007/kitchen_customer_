import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/Validator/validators.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/resources/utils/Apis/apis.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/auth/user_controller.dart';
import 'package:tiffin_service_customer/view_model/model/auth/UserModel.dart';
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
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  late final UserController _userController;
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;
  late final TextEditingController _birthDateController;
  late final TextEditingController _genderController;
  File? imageFile;
  bool loading = false;
  @override
  void initState() {
    super.initState();

    try {
      _userController = Get.find<UserController>();
    } catch (e) {
      print('UserController is not initialized: $e');
      Get.put(UserController());
      _userController = Get.find<UserController>();
    }

    _nameController =
        TextEditingController(text: _userController.user.username ?? "");
    _emailController =
        TextEditingController(text: _userController.user.email ?? '');
    _birthDateController =
        TextEditingController(text: _userController.user.dob ?? '');
    _genderController =
        TextEditingController(text: _userController.user.gender ?? '');

    // Load existing profile image if available
    if (_userController.user.profileImage.isNotEmpty) {
      if (Uri.tryParse(_userController.user.profileImage)?.isAbsolute ??
          false) {
        imageFile = null;
      } else {
        // Check if the local file exists
        File localFile = File(_userController.user.profileImage);
        if (localFile.existsSync()) {
          imageFile = localFile;
        } else {
          imageFile = null;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    SingleTonClass styles = SingleTonClass.instance;

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
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: imageFile == null
                                  ? (Uri.tryParse(_userController
                                                  .user.profileImage)
                                              ?.isAbsolute ??
                                          false
                                      ? Image.network(
                                          _userController.user.profileImage,
                                          height: 134,
                                          width: 134,
                                          fit: BoxFit.cover)
                                      : Image.asset(styles.appimg.Profileimg,
                                          height: 134,
                                          width: 134,
                                          fit: BoxFit.cover))
                                  : Image.file(imageFile!,
                                      height: 134,
                                      width: 134,
                                      fit: BoxFit.cover),
                            ),
                            InkWell(
                                onTap: () async {
                                  var result =
                                      await Get.bottomSheet(Image_Picker());
                                  if (result != null) {
                                    setState(() {
                                      imageFile = result;
                                    });
                                  }
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
                            hinttext: LanguageConstants.enteryourname.tr,
                            validator: TextValidator()),
                        Gap(10),
                        Text(LanguageConstants.email.tr,
                            style: styles.textthme.fs16_regular.copyWith(
                                color: controller.isDarkMode()
                                    ? styles.appcolors.whitecolor
                                    : styles.appcolors.black50)),
                        Textfieldwidget(
                          controller: _emailController,
                          hinttext: LanguageConstants.Mail.tr,
                          validator: EmailValidator(),
                        ),
                        Gap(30),
                        Showdatepickerwidget(
                            datecontroller: _birthDateController,
                            hinttext: "DD/MM/YY"),
                        Gap(30),
                            GenderDropDownWidget(
                      onGenderChanged: (val) {
                        _genderController.text = val ?? '';
                      },
                    )
                      ])),
                  Gap(15),
                  Row(children: [
                    Primarybtn(
                        loading: loading,
                        isExpanded: true,
                        name: LanguageConstants.update_profile.tr,
                        onPressed: () async {
                          if (_globalKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            try {
                              await Apis.updateUser(
                                id: _userController.user.uid,
                                username: _nameController.text.trim(),
                                email: _emailController.text.trim(),
                                dob: _birthDateController.text.trim(),
                                gender: _genderController.text.trim(),
                                profileImage: imageFile,
                              );

                              _userController.setUser(Usermodel(
                                uid: _userController.user.uid,
                                username: _nameController.text.trim(),
                                email: _emailController.text.trim(),
                                dob: _birthDateController.text.trim(),
                                // gender: _genderController.text.trim(),
                                profileImage: imageFile?.path ??
                                    _userController.user.profileImage,
                              ));

                              Profileeditdialog(); // Show success dialog
                            } catch (e) {
                              print(e.toString());
                              Get.snackbar('Error',
                                  'Failed to update profile. Please try again.');
                            } finally {
                              setState(() {
                                loading = false;
                              });
                            }
                          }
                        })
                  ]),
                  Gap(10)
                ]))));
  }
}
