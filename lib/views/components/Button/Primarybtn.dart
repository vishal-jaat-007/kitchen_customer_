import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

// ignore: must_be_immutable
class Primarybtn extends StatelessWidget {
  String name;
  bool isExpanded;
  Function onPressed;
  double? radius;
  double height;
  double width;
  Color? backgroundColor, foregroundColor, borderclr;
  Primarybtn(
      {super.key,
      required this.name,
      this.isExpanded = false,
      required this.onPressed,
      this.radius,
      this.height = 12,
      this.width = 10,
      this.backgroundColor,
      this.borderclr,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;

    final btn = TextButton(
        style: TextButton.styleFrom(
            padding:
                EdgeInsets.symmetric(horizontal: width.w, vertical: height.h),
            shape: radius == null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r))
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                    radius!,
                  )),
            side: BorderSide(
                color: borderclr == null
                    ? styles.appcolors.primarycolor
                    : borderclr!),
            backgroundColor: backgroundColor ?? styles.appcolors.primarycolor,
            foregroundColor: foregroundColor ?? styles.appcolors.transparent),
        onPressed: () {
          onPressed();
        },
        child: Text(name,
            style: styles.textthme.fs16_regular.copyWith(
                color: foregroundColor == null
                    ? styles.appcolors.whitecolor
                    : foregroundColor)));
    return isExpanded ? Expanded(child: btn) : btn;
  }
}
