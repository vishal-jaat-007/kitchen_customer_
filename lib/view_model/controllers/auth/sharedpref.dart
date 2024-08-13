import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref {
  static late SharedPreferences _pref;
  static final String useridkey = "user";
  static sharedpreferences() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future setpref(String key, String value) async { 
    await _pref.setString(key, value);
  }

  static dynamic getpref(String key) {
    return _pref.getString(key);
  }

  static Future<void> removepref(String key) async {
    await _pref.remove(key);
  }
}
