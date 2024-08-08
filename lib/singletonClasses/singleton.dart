import 'package:tiffin_service_customer/resources/utils/text_themes.dart';

import '../resources/utils/app_color.dart';
import '../resources/utils/img_icon.dart';

class SingleTonClass {
  SingleTonClass._init();
  static SingleTonClass get instance => SingleTonClass._init();

  // ---------------- APP COLORS ------------------

  final _appcolors = AppColor();
  AppColor get appcolors => _appcolors;
  // ---------------- APP TEXT THEME ------------------

  final _texttheme = GetTextTheme();
  GetTextTheme get textthme => _texttheme;

  // ---------------- APP IMAGE ------------------

  final _Appimg = Appimages();
  Appimages get appimg => _Appimg;
  // ---------------- APP ICON ------------------

  final _Appicon = Appicon();
  Appicon get appicon => _Appicon;
}
