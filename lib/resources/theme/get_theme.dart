import 'package:flutter/material.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';

class GetTheme {
  static SingleTonClass _styles = SingleTonClass.instance;
  // ----------------------
  // -----------------LIGHT THEME-------------
  // ----------------------
  static ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: _styles.appcolors.primarycolor,

      // --bottombar light---
      bottomAppBarTheme: BottomAppBarTheme(color: styles.appcolors.transparent),

      // ------------- DIALOG LIGHT---
      dialogTheme: DialogTheme(
          backgroundColor: _styles.appcolors.whitecolor,
          surfaceTintColor: _styles.appcolors.whitecolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

      // -------- Scaffold LIGHT THEME-----
      scaffoldBackgroundColor: _styles.appcolors.lightbg,

      // -------APP BAR LIGHT THEME---
      appBarTheme: AppBarTheme(
          backgroundColor: _styles.appcolors.transparent,
          foregroundColor: _styles.appcolors.blackcolor,
          titleTextStyle: _styles.textthme.fs16_regular
              .copyWith(color: _styles.appcolors.blackcolor),
          elevation: 0),

      // ---BottomNavigationBar--- light--
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: styles.appcolors.blackcolor,
          unselectedIconTheme:
              IconThemeData(color: styles.appcolors.blackcolor),
          backgroundColor: styles.appcolors.whitecolor));
// ----------------
  // -------------DARK THEME-------------------------------
// ------------------
  static ThemeData dartTheme = ThemeData.dark().copyWith(
      primaryColor: _styles.appcolors.primarycolor,

      // --BottomAppBar dark--
      bottomAppBarTheme: BottomAppBarTheme(color: styles.appcolors.lightblack),

// ------------- DIALOG dark---
      dialogTheme: DialogTheme(
          backgroundColor: _styles.appcolors.lightblack,
          surfaceTintColor: _styles.appcolors.lightblack,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

      // -------- Scaffold DARK THEME-----
      scaffoldBackgroundColor: _styles.appcolors.blackcolor,

      // -------APP BAR DARK THEME---
      appBarTheme: AppBarTheme(
          backgroundColor: _styles.appcolors.blackcolor,
          foregroundColor: _styles.appcolors.whitecolor,
          titleTextStyle: _styles.textthme.fs16_regular,
          elevation: 0),

      // ---BottomNavigationBar--- dark--
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: styles.appcolors.whitecolor,
          unselectedIconTheme:
              IconThemeData(color: styles.appcolors.whitecolor),
          backgroundColor: styles.appcolors.darktheme_highlight));
}
