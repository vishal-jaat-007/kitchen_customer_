// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/views/components/dilog/exit_dilog.dart';
import 'package:tiffin_service_customer/views/pages/pages.dart';

class MyBottomNavi extends StatefulWidget {
  const MyBottomNavi({super.key});

  @override
  State<MyBottomNavi> createState() => _Bottom_naviState();
}

class _Bottom_naviState extends State<MyBottomNavi> {
  List<Widget> screen = [
    HomeScreen(),
    OrdersScreen(),
    //  Loginview(),
    Myprofileview()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (currentIndex != 0) {
          setState(() {
            currentIndex = 0;
          });
        } else {
          Get.dialog(EixtAppDailog(), barrierDismissible: false);
          ;
        }
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          child: BottomNavigationBar(
              selectedLabelStyle: styles.textthme.fs14_regular,
              currentIndex: currentIndex,
              // unselectedItemColor: styles.appcolors.blackcolor,
              selectedItemColor: styles.appcolors.primarycolor,
              type: BottomNavigationBarType.fixed,
              onTap: (v) => setState(() {
                    currentIndex = v;
                  }),
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      height: 34,
                      width: 90,
                      margin: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == 0
                            ? styles.appcolors.primaryColorLight
                            : Colors.transparent,
                      ),
                      child: Icon(Icons.home),
                    ),
                    label: LanguageConstants.home.tr),
                BottomNavigationBarItem(
                    icon: Container(
                      height: 34,
                      width: 90,
                      margin: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == 1
                            ? styles.appcolors.primaryColorLight
                            : Colors.transparent,
                      ),
                      child: Icon(Icons.assignment_add),
                    ),
                    label: LanguageConstants.myTiffin.tr),
                BottomNavigationBarItem(
                    icon: Container(
                        height: 34,
                        width: 90,
                        margin: EdgeInsets.only(bottom: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == 2
                              ? styles.appcolors.primaryColorLight
                              : Colors.transparent,
                        ),
                        child: Icon(Icons.person_outline_rounded)),
                    label: LanguageConstants.profile.tr),
              ]),
        ),
        body: screen[currentIndex],
      ),
    );
  }
}
