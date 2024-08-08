import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/resources/primary_decorations.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';

import '../../../resources/Validator/validators.dart';

class Textfieldwidget extends StatefulWidget {
  String? hinttext;
  bool readOnly;
  IconData? suffixIcon;
  Color? bgcolr;
  bool suffic;
  int? fontSize;
  AppValidator? validator;
  TextEditingController? controller;
  Textfieldwidget({
    super.key,
    this.hinttext,
    this.readOnly = false,
    this.suffixIcon,
    this.bgcolr,
    this.fontSize,
    this.validator,
    this.controller,
    this.suffic = false,
  });

  @override
  State<Textfieldwidget> createState() => _TextfieldwidgetState();
}

class _TextfieldwidgetState extends State<Textfieldwidget> {
  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();

    return TextFormField(
        controller: widget.controller,
        validator: widget.validator == null
            ? null
            : (value) => widget.validator!.validate("", value),
        readOnly: widget.readOnly,

        // ---DECORATION--
        decoration: PrimaryDecorations.primaryTextFieldDecoration.copyWith(
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: styles.appcolors.darkred)),
            suffixStyle: styles.textthme.fs16_regular
                .copyWith(color: styles.appcolors.primarycolor),
            // -------SUFFIC ICON BUTTON---
            suffixIcon: widget.suffic == false
                ? Icon(widget.suffixIcon,
                    color: widget.readOnly == false
                        ? styles.appcolors.blackcolor
                        : controller.isDarkMode()
                            ? styles.appcolors.whitecolor
                            : styles.appcolors.black20)
  
                // -------SUFFIC TEXT BUTTON---
                : InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 24,
                                child: VerticalDivider(
                                  color: styles.appcolors.primarycolor,
                                ),
                              ),
                              Text(LanguageConstants.update.tr,
                                  style: styles.textthme.fs16_regular.copyWith(
                                      color: styles.appcolors.primarycolor))
                            ]))),

            // -------TEXT---

            hintText: widget.hinttext,
            hintStyle: widget.readOnly == false
                ? widget.fontSize == null
                    ? styles.textthme.fs16_regular
                    : styles.textthme.fs14_regular
                        .copyWith(color: styles.appcolors.black60)
                : styles.textthme.fs16_regular.copyWith(
                    color: controller.isDarkMode()
                        ? styles.appcolors.whitecolor.withOpacity(0.2)
                        : styles.appcolors.black30)));
  }
}
