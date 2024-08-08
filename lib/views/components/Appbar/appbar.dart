import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryAppBar extends AppBar {
  final String titleText;
  bool textcenter;
  double? titleSpacing;
  PrimaryAppBar(
      {required this.titleText, this.textcenter = false, this.titleSpacing = 0})
      : super(
            title: Text(titleText),
            titleSpacing: titleSpacing == null ? 0 : titleSpacing,
            centerTitle: textcenter == false ? false : textcenter);

  @override
  bool forceMaterialTransparency = true;

  @override
  SystemUiOverlayStyle? systemOverlayStyle = SystemUiOverlayStyle.dark;
}
