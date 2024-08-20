import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Divider/gradient_divider.dart';

class Image_Picker extends StatefulWidget {
  Image_Picker({super.key});

  @override
  State<Image_Picker> createState() => _Image_PickerState();
}

class _Image_PickerState extends State<Image_Picker> {
  final controller = Get.find<ThemeController>();
  File? imagefile;  
  int currentindex = -1;
  getImageFormGallery() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    if (getImage != null) {
      setState(() {
        imagefile = File(getImage.path);
      });
      Get.back(result: imagefile);
    }
  }

  getImageFormCamra() async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.camera);

    if (getImage != null) {
      setState(() {
        imagefile = File(getImage.path);
      });
      Get.back(result: imagefile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: controller.isDarkMode()
              ? styles.appcolors.darktheme_highlight
              : Colors.white,
          borderRadius: BorderRadius.circular(30)),
      width: MediaQuery.of(context).size.width,
      height: 185,
      child: Column(children: [
        GestureDetector(
            onTap: () {
              Get.back(result: imagefile);
            },
            child: Align(
                alignment: Alignment.topRight,
                child:
                    Icon(Icons.close, color: styles.appcolors.primarycolor))),
        Text(LanguageConstants.ChooseOptions.tr,
            style: styles.textthme.fs20_semibold
                .copyWith(color: styles.appcolors.primarycolor)),
        Gap(15),
        DividerWidget(isCenterGradient: true),
        Gap(15),
        Row(children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                currentindex = 0;
              });
              getImageFormGallery();
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: currentindex == 0
                            ? styles.appcolors.primarycolor
                            : controller.isDarkMode()
                                ? styles.appcolors.whitecolor.withOpacity(0.3)
                                : styles.appcolors.black50)),
                child: Column(children: [
                  Icon(Icons.image_outlined, size: 21),
                  Gap(8),
                  Text(LanguageConstants.Chooselibrary.tr,
                      style: styles.textthme.fs14_medium)
                ])),
          )),
          Gap(20),
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                currentindex = 1;
              });

              getImageFormCamra();
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: currentindex == 1
                            ? styles.appcolors.primarycolor
                            : controller.isDarkMode()
                                ? styles.appcolors.whitecolor.withOpacity(0.3)
                                : styles.appcolors.black50)),
                child: Column(children: [
                  Icon(Icons.camera_alt_outlined, size: 21),
                  Gap(8),
                  Text(LanguageConstants.Takephoto.tr,
                      style: styles.textthme.fs14_medium)
                ])),
          ))
        ]),
      ]),
    ));
  }
}
