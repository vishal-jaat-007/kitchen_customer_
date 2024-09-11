import 'package:dropdown_plus_plus/dropdown_plus_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/resources/primary_decorations.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/enums/enums.dart';

class GenderDropDownWidget extends StatelessWidget {
  final Function(String?) onGenderChanged;

  GenderDropDownWidget({super.key, required this.onGenderChanged});

  @override
  Widget build(BuildContext context) {
    final SingleTonClass styles = SingleTonClass.instance;
    final ThemeController themeController = Get.find<ThemeController>();

    final optionsList = Gender.values.map((e) => e.toString()).toList();

    return TextDropdownFormField(
      controller: DropdownEditingController(),
      options: optionsList,
      dropdownHeight: 100,
      dropdownItemColor: styles.appcolors.primarycolor,
      dropdownColor: themeController.isDarkMode()
          ? styles.appcolors.darktheme_highlight
          : styles.appcolors.whitecolor,
      findFn: (v) async => v.trim().isEmpty
          ? optionsList
          : optionsList
              .where((element) => element
                  .toLowerCase()
                  .trim()
                  .startsWith(v.toLowerCase().trim()))
              .toList(),
      decoration: PrimaryDecorations.primaryTextFieldDecoration.copyWith(
        labelText: LanguageConstants.gender.tr,
        suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
      ),
      onChanged: (dynamic value) {
        if (value is String) {
          onGenderChanged(value); // Call the function with the selected value
        }
      },
    );
  }
}
