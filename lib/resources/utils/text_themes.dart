// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiffin_service_customer/main.dart';

class GetTextTheme {
  final _largetheme = LargeTextTheme();
  final _Smalltheme = Smalltexttheme();

  final _breakpoint = screenSize.width > 400;

  //..........regular...........//

  TextStyle get fs10_regular =>
      _breakpoint ? _largetheme.fs10_regular : _Smalltheme.fs10_regular;
  TextStyle get fs12_regular =>
      _breakpoint ? _largetheme.fs12_regular : _Smalltheme.fs12_regular;
  TextStyle get fs14_regular =>
      _breakpoint ? _largetheme.fs14_regular : _Smalltheme.fs14_regular;
  TextStyle get fs16_regular =>
      _breakpoint ? _largetheme.fs16_regular : _Smalltheme.fs16_regular;
  TextStyle get fs18_regular =>
      _breakpoint ? _largetheme.fs18_regular : _Smalltheme.fs18_regular;
  TextStyle get fs20_regular =>
      _breakpoint ? _largetheme.fs20_regular : _Smalltheme.fs20_regular;
  TextStyle get fs22_regular =>
      _breakpoint ? _largetheme.fs22_regular : _Smalltheme.fs22_regular;
  TextStyle get fs24_regular =>
      _breakpoint ? _largetheme.fs24_regular : _Smalltheme.fs24_regular;
  TextStyle get fs26_regular =>
      _breakpoint ? _largetheme.fs26_regular : _Smalltheme.fs26_regular;
  TextStyle get fs28_regular =>
      _breakpoint ? _largetheme.fs28_regular : _Smalltheme.fs28_regular;
  TextStyle get fs32_regular =>
      _breakpoint ? _largetheme.fs32_regular : _Smalltheme.fs32_regular;
  TextStyle get fs34_regular =>
      _breakpoint ? _largetheme.fs34_regular : _Smalltheme.fs34_regular;
  TextStyle get fs38_regular =>
      _breakpoint ? _largetheme.fs38_regular : _Smalltheme.fs38_regular;
  TextStyle get fs40_regular =>
      _breakpoint ? _largetheme.fs40_regular : _Smalltheme.fs40_regular;
  TextStyle get fs42_regular =>
      _breakpoint ? _largetheme.fs42_regular : _Smalltheme.fs42_regular;

  //-------medium-----------//

  TextStyle get fs12_medium =>
      _breakpoint ? _largetheme.fs12_medium : _Smalltheme.fs12_medium;
  TextStyle get fs14_medium =>
      _breakpoint ? _largetheme.fs14_medium : _Smalltheme.fs14_medium;
  TextStyle get fs16_medium =>
      _breakpoint ? _largetheme.fs16_medium : _Smalltheme.fs16_medium;
  TextStyle get fs18_medium =>
      _breakpoint ? _largetheme.fs18_medium : _Smalltheme.fs18_medium;
  TextStyle get fs20_medium =>
      _breakpoint ? _largetheme.fs20_medium : _Smalltheme.fs20_medium;
  TextStyle get fs22_medium =>
      _breakpoint ? _largetheme.fs22_medium : _Smalltheme.fs22_medium;
  TextStyle get fs24_medium =>
      _breakpoint ? _largetheme.fs24_medium : _Smalltheme.fs24_medium;
  TextStyle get fs26_medium =>
      _breakpoint ? _largetheme.fs26_medium : _Smalltheme.fs26_medium;
  TextStyle get fs28_medium =>
      _breakpoint ? _largetheme.fs28_medium : _Smalltheme.fs28_medium;
  TextStyle get fs32_medium =>
      _breakpoint ? _largetheme.fs32_medium : _Smalltheme.fs32_medium;
  TextStyle get fs34_medium =>
      _breakpoint ? _largetheme.fs34_medium : _Smalltheme.fs34_medium;
  TextStyle get fs38_medium =>
      _breakpoint ? _largetheme.fs38_medium : _Smalltheme.fs38_medium;
  TextStyle get fs40_medium =>
      _breakpoint ? _largetheme.fs40_medium : _Smalltheme.fs40_medium;
  TextStyle get fs42_medium =>
      _breakpoint ? _largetheme.fs42_medium : _Smalltheme.fs42_medium;

//-----------semi----------bold--------//

  TextStyle get fs12_semibold =>
      _breakpoint ? _largetheme.fs12_semibold : _Smalltheme.fs12_semibold;
  TextStyle get fs14_semibold =>
      _breakpoint ? _largetheme.fs14_semibold : _Smalltheme.fs14_semibold;
  TextStyle get fs16_semibold =>
      _breakpoint ? _largetheme.fs16_semibold : _Smalltheme.fs16_semibold;
  TextStyle get fs18_semibold =>
      _breakpoint ? _largetheme.fs18_semibold : _Smalltheme.fs18_semibold;
  TextStyle get fs20_semibold =>
      _breakpoint ? _largetheme.fs20_semibold : _Smalltheme.fs20_semibold;
  TextStyle get fs22_semibold =>
      _breakpoint ? _largetheme.fs22_semibold : _Smalltheme.fs22_semibold;
  TextStyle get fs24_semibold =>
      _breakpoint ? _largetheme.fs24_semibold : _Smalltheme.fs24_semibold;
  TextStyle get fs26_semibold =>
      _breakpoint ? _largetheme.fs26_semibold : _Smalltheme.fs26_semibold;
  TextStyle get fs28_semibold =>
      _breakpoint ? _largetheme.fs28_semibold : _Smalltheme.fs28_semibold;
  TextStyle get fs32_semibold =>
      _breakpoint ? _largetheme.fs32_semibold : _Smalltheme.fs32_semibold;
  TextStyle get fs34_semibold =>
      _breakpoint ? _largetheme.fs34_semibold : _Smalltheme.fs34_semibold;
  TextStyle get fs38_semibold =>
      _breakpoint ? _largetheme.fs38_semibold : _Smalltheme.fs38_semibold;
  TextStyle get fs40_semibold =>
      _breakpoint ? _largetheme.fs40_semibold : _Smalltheme.fs40_semibold;
  TextStyle get fs42_semibold =>
      _breakpoint ? _largetheme.fs42_semibold : _Smalltheme.fs42_semibold;
}

class LargeTextTheme {
  //.....regular........//

  TextStyle fs10_regular =
      GoogleFonts.outfit(fontSize: 10, fontWeight: FontWeight.w400);
  TextStyle fs12_regular =
      GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w400);
  TextStyle fs14_regular =
      GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w400);
  TextStyle fs16_regular =
      GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w400);
  TextStyle fs18_regular =
      GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w400);
  TextStyle fs20_regular =
      GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w400);
  TextStyle fs22_regular =
      GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w400);
  TextStyle fs24_regular =
      GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w400);
  TextStyle fs26_regular =
      GoogleFonts.outfit(fontSize: 26, fontWeight: FontWeight.w400);
  TextStyle fs28_regular =
      GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w400);
  TextStyle fs32_regular =
      GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.w400);
  TextStyle fs34_regular =
      GoogleFonts.outfit(fontSize: 34, fontWeight: FontWeight.w400);
  TextStyle fs38_regular =
      GoogleFonts.outfit(fontSize: 38, fontWeight: FontWeight.w400);
  TextStyle fs40_regular =
      GoogleFonts.outfit(fontSize: 40, fontWeight: FontWeight.w400);
  TextStyle fs42_regular =
      GoogleFonts.outfit(fontSize: 42, fontWeight: FontWeight.w400);

  //.....medium........//

  TextStyle fs12_medium =
      GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w500);
  TextStyle fs14_medium =
      GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w500);
  TextStyle fs16_medium =
      GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle fs18_medium =
      GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w500);
  TextStyle fs20_medium =
      GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w500);
  TextStyle fs22_medium =
      GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w500);
  TextStyle fs24_medium =
      GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w500);
  TextStyle fs26_medium =
      GoogleFonts.outfit(fontSize: 26, fontWeight: FontWeight.w500);
  TextStyle fs28_medium =
      GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w500);
  TextStyle fs32_medium =
      GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.w500);
  TextStyle fs34_medium =
      GoogleFonts.outfit(fontSize: 34, fontWeight: FontWeight.w500);
  TextStyle fs38_medium =
      GoogleFonts.outfit(fontSize: 38, fontWeight: FontWeight.w500);
  TextStyle fs40_medium =
      GoogleFonts.outfit(fontSize: 40, fontWeight: FontWeight.w500);
  TextStyle fs42_medium =
      GoogleFonts.outfit(fontSize: 42, fontWeight: FontWeight.w500);

  //.....semi--bold........//

  TextStyle fs12_semibold =
      GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w700);
  TextStyle fs14_semibold =
      GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w700);
  TextStyle fs16_semibold =
      GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700);
  TextStyle fs18_semibold =
      GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700);
  TextStyle fs20_semibold =
      GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700);
  TextStyle fs22_semibold =
      GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w700);
  TextStyle fs24_semibold =
      GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w700);
  TextStyle fs26_semibold =
      GoogleFonts.outfit(fontSize: 26, fontWeight: FontWeight.w700);
  TextStyle fs28_semibold =
      GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w700);
  TextStyle fs32_semibold =
      GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.w700);
  TextStyle fs34_semibold =
      GoogleFonts.outfit(fontSize: 34, fontWeight: FontWeight.w700);
  TextStyle fs38_semibold =
      GoogleFonts.outfit(fontSize: 38, fontWeight: FontWeight.w700);
  TextStyle fs40_semibold =
      GoogleFonts.outfit(fontSize: 40, fontWeight: FontWeight.w700);
  TextStyle fs42_semibold =
      GoogleFonts.outfit(fontSize: 42, fontWeight: FontWeight.w700);
}

class Smalltexttheme {
  //.....regular........//

  TextStyle fs10_regular =
      GoogleFonts.outfit(fontSize: 8, fontWeight: FontWeight.w400);
  TextStyle fs12_regular =
      GoogleFonts.outfit(fontSize: 10, fontWeight: FontWeight.w400);
  TextStyle fs14_regular =
      GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w400);
  TextStyle fs16_regular =
      GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w400);
  TextStyle fs18_regular =
      GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w400);
  TextStyle fs20_regular =
      GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w400);
  TextStyle fs22_regular =
      GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w400);
  TextStyle fs24_regular =
      GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w400);
  TextStyle fs26_regular =
      GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w400);
  TextStyle fs28_regular =
      GoogleFonts.outfit(fontSize: 26, fontWeight: FontWeight.w400);
  TextStyle fs32_regular =
      GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w400);
  TextStyle fs34_regular =
      GoogleFonts.outfit(fontSize: 30, fontWeight: FontWeight.w400);
  TextStyle fs38_regular =
      GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.w400);
  TextStyle fs40_regular =
      GoogleFonts.outfit(fontSize: 34, fontWeight: FontWeight.w400);
  TextStyle fs42_regular =
      GoogleFonts.outfit(fontSize: 40, fontWeight: FontWeight.w400);

  //.....medium........//

  TextStyle fs12_medium =
      GoogleFonts.outfit(fontSize: 10, fontWeight: FontWeight.w500);
  TextStyle fs14_medium =
      GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w500);
  TextStyle fs16_medium =
      GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w500);
  TextStyle fs18_medium =
      GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle fs20_medium =
      GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w500);
  TextStyle fs22_medium =
      GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w500);
  TextStyle fs24_medium =
      GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w500);
  TextStyle fs26_medium =
      GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w500);
  TextStyle fs28_medium =
      GoogleFonts.outfit(fontSize: 26, fontWeight: FontWeight.w500);
  TextStyle fs32_medium =
      GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w500);
  TextStyle fs34_medium =
      GoogleFonts.outfit(fontSize: 30, fontWeight: FontWeight.w500);
  TextStyle fs38_medium =
      GoogleFonts.outfit(fontSize: 36, fontWeight: FontWeight.w500);
  TextStyle fs40_medium =
      GoogleFonts.outfit(fontSize: 38, fontWeight: FontWeight.w500);
  TextStyle fs42_medium =
      GoogleFonts.outfit(fontSize: 40, fontWeight: FontWeight.w500);

  //.....semi--bold........//

  TextStyle fs12_semibold =
      GoogleFonts.outfit(fontSize: 10, fontWeight: FontWeight.w700);
  TextStyle fs14_semibold =
      GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w700);
  TextStyle fs16_semibold =
      GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w700);
  TextStyle fs18_semibold =
      GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700);
  TextStyle fs20_semibold =
      GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700);
  TextStyle fs22_semibold =
      GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700);
  TextStyle fs24_semibold =
      GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w700);
  TextStyle fs26_semibold =
      GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w700);
  TextStyle fs28_semibold =
      GoogleFonts.outfit(fontSize: 26, fontWeight: FontWeight.w700);
  TextStyle fs32_semibold =
      GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w700);
  TextStyle fs34_semibold =
      GoogleFonts.outfit(fontSize: 30, fontWeight: FontWeight.w700);
  TextStyle fs38_semibold =
      GoogleFonts.outfit(fontSize: 36, fontWeight: FontWeight.w700);
  TextStyle fs40_semibold =
      GoogleFonts.outfit(fontSize: 38, fontWeight: FontWeight.w700);
  TextStyle fs42_semibold =
      GoogleFonts.outfit(fontSize: 40, fontWeight: FontWeight.w700);
}
