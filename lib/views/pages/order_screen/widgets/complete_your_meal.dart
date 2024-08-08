import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/add_on_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/counter_controller.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/widgets/icon_btn.dart';

class CompleteYourMealwidget extends StatelessWidget {
  const CompleteYourMealwidget({super.key});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final AddonController addonController =
        Get.put(AddonController(), permanent: true);

    final CounterController rotiController =
        Get.put(CounterController(), tag: 'roti');
    final CounterController jeeraRaytaController =
        Get.put(CounterController(), tag: 'jeera_rayta');
    final CounterController dahiController =
        Get.put(CounterController(), tag: 'dahi');

    return Obx(() => addonController.addons.isNotEmpty
        ? Containerwidget(
            shadow: false,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "${LanguageConstants.completeYourMeal.tr}",
                style: styles.textthme.fs16_regular,
              ),
              Gap(10),

              //--------Roti----------//
              Obx(() => addonController.rotiSelected.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${LanguageConstants.roti.tr}",
                            style: styles.textthme.fs16_regular,
                          ),
                        ),
                        IconBtn(
                          countervalue: rotiController.counter,
                          iconcolr: styles.appcolors.whitecolor,
                          onDecrement: () {
                            rotiController.decrement();
                            addonController.addAddon(
                              LanguageConstants.roti.tr,
                              rotiController.counter.value * 50,
                              addonController.rotiSelected.value,
                            );
                          },
                          onIncrement: () {
                            rotiController.increment();
                            addonController.addAddon(
                              LanguageConstants.roti.tr,
                              rotiController.counter.value * 50,
                              addonController.rotiSelected.value,
                            );
                          },
                          bgcolr: styles.appcolors.primarycolor,
                        ),
                      ],
                    )
                  : SizedBox()),

              Gap(8),

              //----------Jeera Rayta---------//
              Obx(() => addonController.jeeraRaytaSelected.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${LanguageConstants.jeeraRayta.tr}",
                            style: styles.textthme.fs16_regular,
                          ),
                        ),
                        IconBtn(
                          countervalue: jeeraRaytaController.counter,
                          iconcolr: styles.appcolors.whitecolor,
                          onDecrement: () {
                            jeeraRaytaController.decrement();
                            addonController.addAddon(
                              LanguageConstants.jeeraRayta.tr,
                              jeeraRaytaController.counter.value * 50,
                              addonController.jeeraRaytaSelected.value,
                            );
                          },
                          onIncrement: () {
                            jeeraRaytaController.increment();
                            addonController.addAddon(
                              LanguageConstants.jeeraRayta.tr,
                              jeeraRaytaController.counter.value * 50,
                              addonController.jeeraRaytaSelected.value,
                            );
                          },
                          bgcolr: styles.appcolors.primarycolor,
                        ),
                      ],
                    )
                  : SizedBox()),

              Gap(8),

              //-----------Dahi---------//
              Obx(() => addonController.dahiSelected.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${LanguageConstants.dahi.tr}",
                            style: styles.textthme.fs16_regular,
                          ),
                        ),
                        IconBtn(
                          countervalue: dahiController.counter,
                          iconcolr: styles.appcolors.whitecolor,
                          onDecrement: () {
                            dahiController.decrement();
                            addonController.addAddon(
                              LanguageConstants.dahi.tr,
                              dahiController.counter.value * 50,
                              addonController.dahiSelected.value,
                            );
                          },
                          onIncrement: () {
                            dahiController.increment();
                            addonController.addAddon(
                              LanguageConstants.dahi.tr,
                              dahiController.counter.value * 50,
                              addonController.dahiSelected.value,
                            );
                          },
                          bgcolr: styles.appcolors.primarycolor,
                        ),
                      ],
                    )
                  : SizedBox()),
            ]),
          )
        : SizedBox());
  }
}
