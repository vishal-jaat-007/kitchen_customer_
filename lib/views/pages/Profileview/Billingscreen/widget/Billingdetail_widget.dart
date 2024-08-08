import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

class Billingdetails_widget extends StatelessWidget {
  String srno, qty, Total, Mealbreakfast;

  Billingdetails_widget(
      {super.key,
      required this.srno,
      required this.Mealbreakfast,
      required this.qty,
      required this.Total});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Mealbreakfast,
            style: styles.textthme.fs16_regular
                .copyWith(color: styles.appcolors.primarycolor)),
        Gap(10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(child: Text(srno.tr, style: styles.textthme.fs16_regular)),

          // Gap(1),
          Expanded(
              child: Text(qty,
                  textAlign: TextAlign.center,
                  style: styles.textthme.fs16_regular)),
          // Gap(1),
          Expanded(
              child: Text(Total,
                  textAlign: TextAlign.right,
                  style: styles.textthme.fs16_regular))
        ]),
        Gap(10),
        ...List.generate(
            2,
            (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(LanguageConstants.breakfast.tr,
                              style: styles.textthme.fs16_regular)),
                      Expanded(
                          child: Text("07*80",
                              textAlign: TextAlign.center,
                              style: styles.textthme.fs16_regular)),
                      Expanded(
                          child: Text("₹80",
                              textAlign: TextAlign.right,
                              style: styles.textthme.fs16_regular))
                    ])),
        Gap(10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(LanguageConstants.grandTotal.tr,
              style: styles.textthme.fs16_regular
                  .copyWith(color: styles.appcolors.primarycolor)),
          Text("₹300",
              style: styles.textthme.fs16_regular
                  .copyWith(color: styles.appcolors.primarycolor))
        ])
      ],
    );
  }
}
