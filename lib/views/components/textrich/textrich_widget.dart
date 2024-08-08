import 'package:flutter/material.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

class TextrichWidget extends StatelessWidget {
  String title, subtitle;
  Function onPressed;
  TextrichWidget(
      {super.key,
      required this.subtitle,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;

    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Text.rich(
        TextSpan(
          text: title,
          style: styles.textthme.fs16_regular,
          children: [
            TextSpan(
                text: subtitle,
                style: styles.textthme.fs16_regular
                    .copyWith(color: styles.appcolors.primarycolor))
          ],
        ),
      ),
    );
  }
}
