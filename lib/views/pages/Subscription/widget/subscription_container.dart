import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/model/subscription_categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';

class subscription_container extends StatefulWidget {
  SubscriptionCategeroyModel data;
  Function onPressed;
  bool backgroundColor;
  subscription_container({
    Key? key,
    required this.onPressed,
    this.backgroundColor = false,
    required this.data,
  }) : super(key: key);

  @override
  subscription_containerState createState() => subscription_containerState();
}

class subscription_containerState extends State<subscription_container> {
  SingleTonClass styles = SingleTonClass.instance;
  final controller = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Containerwidget(
        shadow: false,
        child: Opacity(
          opacity: 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.data.title,
                    style: styles.textthme.fs16_semibold.copyWith(
                        color: widget.backgroundColor == false
                            ? controller.isDarkMode()
                                ? styles.appcolors.whitecolor
                                : styles.appcolors.blackcolor
                            : styles.appcolors.primarycolor),
                  ),
                  Text(
                    LanguageConstants.ongoing.tr,
                    style: styles.textthme.fs16_semibold.copyWith(
                      color: widget.backgroundColor == false
                          ? controller.isDarkMode()
                              ? styles.appcolors.whitecolor
                              : styles.appcolors.blackcolor
                          : styles.appcolors.primarycolor,
                    ),
                  )
                ],
              ),
              Gap(10),
              Text(
                " ₹ ${widget.data.totalprice.toString()}/  ${LanguageConstants.meal.tr}",
                style: styles.textthme.fs16_regular.copyWith(
                  color: widget.backgroundColor == false
                      ? controller.isDarkMode()
                          ? styles.appcolors.whitecolor
                          : styles.appcolors.blackcolor
                      : styles.appcolors.primarycolor,
                ),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " ${widget.data.days.toString()} ${LanguageConstants.fullMeals.tr}",
                    style: styles.textthme.fs16_regular.copyWith(
                      color: widget.backgroundColor == false
                          ? controller.isDarkMode()
                              ? styles.appcolors.whitecolor
                              : styles.appcolors.blackcolor
                          : styles.appcolors.primarycolor,
                    ),
                  ),
                  Text(
                    "${LanguageConstants.today.tr} ₹ ${widget.data.totalprice.toString()} ",
                    style: styles.textthme.fs16_semibold.copyWith(
                      color: widget.backgroundColor == false
                          ? controller.isDarkMode()
                              ? styles.appcolors.whitecolor
                              : styles.appcolors.blackcolor
                          : styles.appcolors.primarycolor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
