import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';

class IconBtn extends StatelessWidget {
  Color bgcolr, iconcolr;
  Function onDecrement, onIncrement;
  RxInt countervalue;

  IconBtn(
      {super.key,
      required this.onDecrement,
      required this.onIncrement,
      required this.bgcolr,
      required this.countervalue,
   
      required this.iconcolr});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onDecrement();
          },
          child: Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  color: bgcolr == bgcolr
                      ? bgcolr
                      : styles.appcolors.primaryColorLight,
                  borderRadius: BorderRadius.circular(5.r)),
              child: Icon(
                Icons.remove,
                color: iconcolr,
              )),
        ),
        Gap(10),
        Obx(() => Text(
              '$countervalue',
              style: TextStyle(fontSize: 18),
            )),
        Gap(10),
        GestureDetector(
          onTap: () {
            onIncrement();
          },
          child: Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: bgcolr == bgcolr
                      ? bgcolr
                      : styles.appcolors.primaryColorLight),
              child: Icon(
                Icons.add,
                color: iconcolr,
              )),
        ),
      ],
    );
  }
}
