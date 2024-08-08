import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/model/order_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Divider/titleBar.dart';
import 'package:tiffin_service_customer/views/components/button/Primarybtn.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  SingleTonClass styles = SingleTonClass.instance;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    return Scaffold(
      appBar: PrimaryAppBar(
        titleSpacing: 15,
        titleText: LanguageConstants.orders.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Thursday, 20-06-24",
                  style: styles.textthme.fs16_regular,
                ),
                Primarybtn(
                  name: LanguageConstants.cancelMeal.tr,
                  onPressed: () {
                    Get.toNamed(Routes.Mealcancellationn);
                  },
                  height: 1,
                )
              ],
            ),
            Gap(15),
            TitleBar(title: "${LanguageConstants.lunch.tr}"),
            Gap(15),
            ListView.builder(
              shrinkWrap: true,
              itemCount: Ordermodeldata.length,
              itemBuilder: (context, index) {
                final order = Ordermodeldata[index];
                return Container(
                  decoration: BoxDecoration(
                      color:controller.isDarkMode()
                          ? styles.appcolors.darktheme_highlight
                          : styles.appcolors.whitecolor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10.r),
                              bottom: Radius.circular(20.r)),
                          child: Image.asset(order.image)),
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  order.foodtype,
                                  style: styles.textthme.fs20_semibold,
                                ),
                              ],
                            ),
                            Gap(5),
                            Text(
                              order.foodname,
                              style: styles.textthme.fs14_regular.copyWith(
                                  color:controller.isDarkMode()
                                      ? styles.appcolors.whitecolor
                                          .withOpacity(0.5)
                                      : styles.appcolors.black60),
                            ),
                            Gap(5),
                            Text(
                              "${LanguageConstants.arrivingAt.tr} ${order.time}:00  PM",
                              style: styles.textthme.fs16_regular,
                            ),
                            Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${LanguageConstants.fromSubscription.tr} ",
                                  style: styles.textthme.fs16_regular.copyWith(
                                      color: styles.appcolors.primarycolor),
                                ),
                                Text(
                                  "${LanguageConstants.upcomingOrder.tr} ",
                                  style: styles.textthme.fs16_regular.copyWith(
                                      color: styles.appcolors.primarycolor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
