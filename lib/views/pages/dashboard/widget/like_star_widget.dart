import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

class LikeStarWidget extends StatelessWidget {
  Color? color;
  double iconSize;
  bool? showrating;
  LikeStarWidget(
      {super.key, this.color, this.iconSize = 24, this.showrating = true});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;

    return IntrinsicHeight(
      child: Row(
        children: [
          showrating == true
              ? Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: iconSize.w,
                      color: color,
                    ),
                    Gap(8),
                    Text(
                      "90%",
                      style:
                          styles.textthme.fs12_regular.copyWith(color: color),
                    ),
                  ],
                )
              : SizedBox(),
          Gap(2),
          SizedBox(
            child: VerticalDivider(
              color: styles.appcolors.primarycolor,
            ),
          ),
          Gap(2),
          Row(
            children: [
              Icon(
                Icons.star,
                size: iconSize.w,
                color: color,
              ),
              Gap(8),
              Text(
                "8.9%",
                style: styles.textthme.fs12_regular.copyWith(color: color),
              ),
            ],
          )
        ],
      ),
    );
  }
}
