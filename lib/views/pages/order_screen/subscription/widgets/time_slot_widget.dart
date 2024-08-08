import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/model/time_slot_model.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';

class TimeSlotWidget extends StatelessWidget {
  final TimeSlot timeSlot;
  final RxString selectedSlot = ''.obs;

  TimeSlotWidget({required this.timeSlot});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
final controller = Get.find<ThemeController>();
    return Containerwidget(
      shadow: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(timeSlot.period, style: styles.textthme.fs16_regular),
          Gap(10),
          Row(
            children: timeSlot.slots.map((slot) {
              return Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Obx(() => TextButton(
                          onPressed: () {
                            selectedSlot.value = slot;
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 2),
                            visualDensity: VisualDensity.compact,
                            backgroundColor: selectedSlot.value == slot
                                ? styles.appcolors.primarycolor
                                : controller.isDarkMode()
                                    ? styles.appcolors.darktheme_highlight
                                    : styles.appcolors.whitecolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              side: BorderSide(
                                  color: styles.appcolors.primarycolor),
                            ),
                          ),
                          child: Text(slot,
                              style: styles.textthme.fs14_medium.copyWith(
                                  color: selectedSlot.value == slot
                                      ? styles.appcolors.whitecolor
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color))))));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
