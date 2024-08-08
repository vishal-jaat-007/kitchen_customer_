import 'package:flutter/material.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

class subtotlewidget extends StatelessWidget {
  String title, subtitle;

  subtotlewidget({super.key, required this.subtitle, required this.title});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: styles.textthme.fs16_regular),
      Text(subtitle, style: styles.textthme.fs16_regular)
    ]);
  }
}
