import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';

class DateRangePickerScreen extends StatefulWidget {
  @override
  _DateRangePickerScreenState createState() => _DateRangePickerScreenState();
}

final controller = Get.find<ThemeController>();

class _DateRangePickerScreenState extends State<DateRangePickerScreen> {
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [];
  final dayTextStyle = TextStyle(
      color:
          controller.isDarkMode() ? styles.appcolors.whitecolor : Colors.black,
      fontWeight: FontWeight.w700);
  final weekendTextStyle = TextStyle(
      color: controller.isDarkMode()
          ? styles.appcolors.whitecolor
          : Colors.grey[500],
      fontWeight: FontWeight.w600);
  final anniversaryTextStyle = TextStyle(
    color: Colors.red[400],
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarDatePicker2(
          config: CalendarDatePicker2WithActionButtonsConfig(
            calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
            dayTextStyle: dayTextStyle,
            calendarType: CalendarDatePicker2Type.multi,
            selectedDayHighlightColor: styles.appcolors.primarycolor,
            closeDialogOnCancelTapped: true,
            firstDayOfWeek: 1,
            weekdayLabelTextStyle: TextStyle(
              color: controller.isDarkMode()
                  ? styles.appcolors.whitecolor
                  : Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            controlsTextStyle: TextStyle(
              color: controller.isDarkMode()
                  ? styles.appcolors.whitecolor
                  : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            centerAlignModePicker: true,
            customModePickerIcon: const SizedBox(),
            selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
          ),
          value: _multiDatePickerValueWithDefaultValue,
          onValueChanged: (dates) =>
              _multiDatePickerValueWithDefaultValue = dates,
        )
      ],
    );
  }
}
