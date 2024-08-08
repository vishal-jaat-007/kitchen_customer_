import 'dart:ui';

import 'package:get/get.dart';
import 'package:tiffin_service_customer/main.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_service.dart';
import 'package:tiffin_service_customer/view_model/model/language_model.dart';

class LanguageController extends GetxController {
  LanguageController() {
    
    setLanguage(preferences.getLanguage());
  }

  Rx<LanguageModel> _selectedLanguage =
      Rx<LanguageModel>(TranslationService.english);
  LanguageModel get selectedLanguage => _selectedLanguage.value;

  setLanguage(LanguageModel data) {
    _selectedLanguage(data);
    Get.updateLocale(Locale(data.languagecode, data.countrycode));
    preferences.setLanguage(data: data);
  }
}  
