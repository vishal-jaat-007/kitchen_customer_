import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/pages/dashboard/widget/like_star_widget.dart';

class Todaymenucontainer extends StatelessWidget {
  final CategoryModel menu;

  Todaymenucontainer({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.onetimeorder, arguments: menu);
      },
      child: Containerwidget(
          padding: EdgeInsets.all(15),
          shadow: true,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  menu.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menu.foodname,
                      maxLines: 1,
                      style: styles.textthme.fs20_semibold,
                    ),
                    Gap(7),
                    Text(
                      "₹${menu.price.toString()}",
                      style: styles.textthme.fs20_medium,
                    ),
                    Gap(7),
                    LikeStarWidget(
                      color: styles.appcolors.primarycolor,
                      iconSize: 24,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
