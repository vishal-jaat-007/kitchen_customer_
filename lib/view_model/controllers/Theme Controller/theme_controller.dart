import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/main.dart';
import 'package:tiffin_service_customer/view_model/model/Theme/theme_model.dart';
import '../../../resources/i18n/translation_files.dart';

class ThemeController extends GetxController {
  ThemeController() {
    setCurrentTheme(preferences.getCurrentTheme());
  }

  ThemesModel get _dark =>
      ThemesModel(title: LanguageConstants.dark, mode: ThemeMode.dark);
  ThemesModel get _light =>
      ThemesModel(title: LanguageConstants.light, mode: ThemeMode.light);
  ThemesModel get _system => ThemesModel( 
      title: LanguageConstants.system_default, mode: ThemeMode.system);

  List<ThemesModel> get themes => [_light, _dark, _system];

  late Rx<ThemesModel> _currentTheme = Rx<ThemesModel>(_light);
  ThemesModel get currentTheme => _currentTheme.value;

  setCurrentTheme(ThemesModel theme) {
    preferences.setCurrentTheme(theme);
    Get.changeThemeMode(theme.mode);
    _currentTheme(theme);
  }

  bool isDarkMode() {
    return currentTheme == _dark ||
        (currentTheme == _system &&
            SchedulerBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark);
  }
}
