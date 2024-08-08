import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/controllers/Subscription_controller.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';

class Radiobtn extends StatelessWidget {
  final String title;
  final RadioController radioController = Get.find<RadioController>();

  Radiobtn({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() => Radio.adaptive(
              visualDensity: VisualDensity.compact,
              activeColor: styles.appcolors.primarycolor,
              value: title,
              groupValue: radioController.selectedValue.value,
              onChanged: (value) {
                radioController.selectValue(value!);
              },
            )),
        Text(title, style: styles.textthme.fs16_regular.copyWith()),
      ],
    );
  }
}
