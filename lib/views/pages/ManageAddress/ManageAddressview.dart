import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/resources/utils/Apis/apis.dart';
import 'package:tiffin_service_customer/view_model/controllers/Address/addresscontroller.dart';
import 'package:tiffin_service_customer/view_model/controllers/user_controller.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Dilog/Logoutdialog.dart';
import 'package:tiffin_service_customer/views/components/Divider/dotted_divider.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';

class Manageaddress extends StatefulWidget {
  const Manageaddress({super.key});

  @override
  State<Manageaddress> createState() => _ManageaddressState();
}

class _ManageaddressState extends State<Manageaddress> {
  @override
  Widget build(BuildContext context) {
    final addresscontroller = Get.find<AddressController>();
    final userController = Get.find<UserController>();

    return Scaffold(
        appBar: PrimaryAppBar(
          titleText: LanguageConstants.manageAddress.tr,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              Containerwidget(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                shadow: true,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.AddAdrees);
                      },
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      leading: Icon(
                        Icons.add_circle_outline,
                        size: 27,
                        color: styles.appcolors.primarycolor,
                      ),
                      title: Text(
                        LanguageConstants.add_address.tr,
                        style: styles.textthme.fs16_regular.copyWith(
                          color: styles.appcolors.primarycolor,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: styles.appcolors.black60,
                      ),
                    ),
                    DottedDivider(),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      leading: Icon(
                        Icons.my_location_rounded,
                        color: styles.appcolors.primarycolor,
                        size: 27,
                      ),
                      title: Text(
                        "Current Location",
                        style: styles.textthme.fs16_regular.copyWith(
                          color: styles.appcolors.primarycolor,
                        ),
                      ),
                      subtitle: Text(
                        "Rishi Nagar, Hisar",
                        style: styles.textthme.fs16_regular,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(15),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Gap(5),
                  Text(
                    LanguageConstants.saved_address.tr,
                    style: styles.textthme.fs12_regular,
                  ),
                  Gap(5),
                  Expanded(
                    child: Transform.rotate(angle: pi, child: Divider()),
                  ),
                ],
              ),
              Gap(15),
              Expanded(
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection("Address")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text("Error: ${snapshot.error}"));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.docs.isEmpty) {
                          return Center(child: Text('No data found'));
                        } else {
                          final data = snapshot.data!.docs;
                          return ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final item = data[index].data();
                                return Containerwidget(
                                    shadow: true,
                                    child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        horizontalTitleGap: 10,
                                        leading: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.home_outlined, size: 30)
                                          ],
                                        ),
                                        title: Text(
                                          item["addresstitle"],
                                          style: styles.textthme.fs16_regular,
                                        ),
                                        subtitle: Text(
                                          "${item['houseNo']}, ${item['contactName']}, ${item['contactNumber']}",
                                          style: styles.textthme.fs14_regular
                                              .copyWith(
                                            color: Get.isDarkMode
                                                ? styles.appcolors.whitecolor
                                                : styles.appcolors.black60,
                                          ),
                                        ),
                                        trailing: Column(children: [
                                          GestureDetector(
                                              onTap: () {
                                                Get.dialog(
                                                  Logoutdialog(
                                                    Buttonname:
                                                        LanguageConstants
                                                            .YesDelete.tr,
                                                    subtitle: LanguageConstants
                                                        .AreyousureyouwanttoDelete
                                                        .tr,
                                                    title: LanguageConstants
                                                        .Delete.tr,
                                                    onPressed: () async {
                                                      await addresscontroller
                                                          .deleteaddress(
                                                              uid: item["id"])
                                                          .then(
                                                        (value) {
                                                          item.remove(
                                                              item[index]);
                                                          setState(() {});
                                                        },
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Icon(
                                                  Icons.delete_outline_outlined,
                                                  color: styles
                                                      .appcolors.primarycolor)),
                                          Gap(5.h),
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed(Routes.AddAdrees,
                                                  arguments: item);
                                            },
                                            child: Icon(Icons.edit_outlined,
                                                color: styles
                                                    .appcolors.primarycolor),
                                          )
                                        ])));
                              });
                        }
                      }))
            ])));
  }
}
