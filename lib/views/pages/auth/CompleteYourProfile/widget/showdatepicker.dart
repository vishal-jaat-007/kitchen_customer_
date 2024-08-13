import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/Validator/validators.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

import '../../../../../resources/primary_decorations.dart';

class Showdatepickerwidget extends StatefulWidget {
  String? hinttext;
  

  Showdatepickerwidget({
    super.key,
    this.hinttext,
  });

  @override
  State<Showdatepickerwidget> createState() => _ShowdatepickerwidgetState();
}

class _ShowdatepickerwidgetState extends State<Showdatepickerwidget> {
  DateTime selectedDate = DateTime.now();

  SingleTonClass styles = SingleTonClass.instance;
  final TextEditingController datecontrollrs = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) =>
            TextValidator().validate(LanguageConstants.dateofbirth.tr, value),
        controller: datecontrollrs,
        readOnly: true,
        onTap: () async {
          final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2015),
              lastDate: selectedDate);
          if (picked != null) {
            setState(() {
              datecontrollrs.text = "${picked.toLocal()}".split(" ")[0];
            });
        
          }
        },
        decoration: PrimaryDecorations.primaryTextFieldDecoration.copyWith(
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: styles.appcolors.darkred)),
          suffixStyle: styles.textthme.fs16_regular
              .copyWith(color: styles.appcolors.primarycolor),
          hintText: "DD/MM/YY".tr,
        ));
  }
}
