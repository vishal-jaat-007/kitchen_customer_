import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/add_on_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/counter_controller.dart';
import 'package:tiffin_service_customer/views/components/Button/Primarybtn.dart';

void showAddonsPopup() {
  SingleTonClass styles = SingleTonClass.instance;
  final AddonController addonController =
      Get.put(AddonController(), permanent: true);

  final rotiController = Get.put(CounterController(), tag: 'roti');
  final CounterController jeeraRaytaController =
      Get.put(CounterController(), tag: 'jeera_rayta');
  final CounterController dahiController =
      Get.put(CounterController(), tag: 'dahi');

  Get.dialog(
    AlertDialog(
      contentPadding: EdgeInsets.all(20),
      actionsAlignment: MainAxisAlignment.end,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //--------Roti----------//
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                styles.appimg.dalMakhani,
                width: 36.w,
                height: 36.h,
              ),
              Gap(10),
              Expanded(
                child: Text(
                  "${LanguageConstants.roti.tr}",
                  style: styles.textthme.fs16_regular,
                ),
              ),
              Obx(() => Checkbox(
                    value: addonController.rotiSelected.value,
                    onChanged: (value) {
                      addonController.rotiSelected.value = value ?? false;
                    },
                  )),
            ],
          ),

          //----------Jeera Rayta---------//
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                styles.appimg.dalMakhani,
                width: 36.w,
                height: 36.h,
              ),
              Gap(10),
              Expanded(
                child: Text(
                  "${LanguageConstants.jeeraRayta.tr}",
                  style: styles.textthme.fs16_regular,
                ),
              ),
              Obx(() => Checkbox(
                    value: addonController.jeeraRaytaSelected.value,
                    onChanged: (value) {
                      addonController.jeeraRaytaSelected.value = value ?? false;
                    },
                  )),
            ],
          ),

          //-----------Dahi---------//
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                styles.appimg.dalMakhani,
                width: 36.w,
                height: 36.h,
              ),
              Gap(10),
              Expanded(
                child: Text(
                  "${LanguageConstants.dahi.tr}",
                  style: styles.textthme.fs16_regular,
                ),
              ),
              Obx(() => Checkbox(
                    value: addonController.dahiSelected.value,
                    onChanged: (value) {
                      addonController.dahiSelected.value = value ?? false;
                    },
                  )),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Primarybtn(
                  name: "Save Changes",
                  height: 0,
                  onPressed: () {
                    addonController.addAddon(
                      LanguageConstants.roti.tr,
                      rotiController.counter.value * 50,
                      addonController.rotiSelected.value,
                    );
                    addonController.addAddon(
                      LanguageConstants.jeeraRayta.tr,
                      jeeraRaytaController.counter.value * 40,
                      addonController.jeeraRaytaSelected.value,
                    );
                    addonController.addAddon(
                      LanguageConstants.dahi.tr,
                      dahiController.counter.value * 30,
                      addonController.dahiSelected.value,
                    );
                    Get.back();
                  }),
            ],
          ),
        ],
      ),
    ),
  );
}
