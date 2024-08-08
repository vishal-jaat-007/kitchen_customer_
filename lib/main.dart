import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/firebase_options.dart';
import 'package:tiffin_service_customer/resources/config/prefs/prefs.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_service.dart';
import 'package:tiffin_service_customer/resources/theme/get_theme.dart';
import 'package:tiffin_service_customer/view_model/bindings/app_bindings.dart';

late Size screenSize;
Prefs preferences = Prefs.instance;

Future<void> main() async {
// ...
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.setPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is th
  //e root of your application.
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return ScreenUtilInit(
        builder: (context, child) => GetMaterialApp(
            title: 'Flutter Demo',
            theme: GetTheme.lightTheme,
            darkTheme: GetTheme.dartTheme,
            initialRoute: AppPages.intialroute,
            getPages: AppPages.routes,
            themeMode: ThemeMode.light,
            translations: TranslationService(),
            fallbackLocale: TranslationService.fallbackLocale,
            locale: TranslationService.locale,
            initialBinding: AppBindings()));
  }
}
