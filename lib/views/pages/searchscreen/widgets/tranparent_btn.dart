// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

/// **  Common Transparent Btn ** ///
/// **   ** ///

class TransprntBtn extends StatelessWidget {
  String text;
  TextStyle style;
  Icon? icon;
  Function onPressed;

  TransprntBtn(
      {super.key,
      required this.text,
      required this.style,
      this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? TextButton(
            child: Text(
              text,
              style: style,
            ),
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero, backgroundColor: Colors.transparent),
            onPressed: () {
              onPressed();
            },
          )
        : TextButton.icon(
            icon: icon!,
            label: Text(
              text,
              style: style,
            ),
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero, backgroundColor: Colors.transparent),
            onPressed: () {
              onPressed();
            },
          );
  }
}
