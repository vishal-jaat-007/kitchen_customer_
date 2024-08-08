import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

class Listtilewidget extends StatelessWidget {
  String image, title, address, time;
  Listtilewidget(
      {super.key,
      required this.image,
      required this.address,
      required this.time,
      required this.title});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(image, width: 55, height: 59, fit: BoxFit.cover),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title.tr, style: styles.textthme.fs16_semibold),
          Text(time, style: styles.textthme.fs16_regular)
        ],
      ),
      subtitle: Text(address, style: styles.textthme.fs14_regular),
    );
  }
}
