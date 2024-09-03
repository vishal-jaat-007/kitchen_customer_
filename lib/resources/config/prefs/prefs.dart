import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiffin_service_customer/view_model/model/Theme/theme_model.dart';
import 'package:tiffin_service_customer/view_model/model/language/language_model.dart';

class Prefs {
  late SharedPreferences _prefs;
  Prefs._init();

  static Prefs get instance => Prefs._init();

  setPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static get _languageKey => "Language";
  static get _darkModeKey => "Theme";

  /// Getter and setter for language
  setLanguage({required LanguageModel data}) {
    _prefs.setString(_languageKey, data.toJson());
  }

  LanguageModel getLanguage() {
    return LanguageModel.fromJson(json: _prefs.getString(_languageKey) ?? '');
  }

  /// Getter and Setter for Dark Mode
  ThemesModel getCurrentTheme() {
    return ThemesModel.fromJson(_prefs.getString(_darkModeKey) ?? "");
  }

  setCurrentTheme(ThemesModel theme) {
    _prefs.setString(_darkModeKey, theme.toJson());
  }
}
