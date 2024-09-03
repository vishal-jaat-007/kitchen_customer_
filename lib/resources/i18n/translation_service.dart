import 'dart:ui';

import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/model/language/language_model.dart';

class TranslationService extends Translations {
  static const locale = Locale('en', 'US');
  static const fallbackLocale = Locale('en', 'US');

  static const LanguageModel english = LanguageModel(
      languagename: "English", languagecode: "en", countrycode: "US");
  static const LanguageModel hindi = LanguageModel(
      languagename: "हिंदी", languagecode: "hi", countrycode: "IN");

  static const List<LanguageModel> languages = [english, hindi];
  @override
  Map<String, Map<String, String>> get keys => {
        english.toString(): enUs,
        hindi.toString(): hiIn,
        'tel_IN': telIn,
        'mar_IN': marIn,
      };
}
