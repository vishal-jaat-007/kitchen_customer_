part of "profile.dart";

class Myprofileview extends StatelessWidget {
  Myprofileview({super.key});

  SingleTonClass styles = SingleTonClass.instance;
  List<Map<String, dynamic>> get tiles => [
        {
          "title": LanguageConstants.applicationSetting,
          "icon": styles.appicon.setting,
          "route": Routes.Applicationsetting
        }
      ];
 
  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(alignment: Alignment(-1, 1.4), children: [
                  Container(
                    height: 240.h,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.r),
                          bottomRight: Radius.circular(40.r)),
                      gradient:
                          LinearGradient(end: Alignment.topCenter, colors: [
                        styles.appcolors.lightorange,
                        Color(0xffFFAE45),
                        Color(0xffFFCB6B),
                        Color(0xffFFDA85),
                        styles.appcolors.lightyellow,
                        styles.appcolors.lightyellow
                      ]),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(styles.appicon.circle)),
                  Profilewidget()
                ]),
             
          Gap(30.h),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Containerwidget(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Column(children: [
                    Profiletile(
                        onPressed: () {
                          Get.toNamed(Routes.Applicationsetting);
                        },
                        image: styles.appicon.setting,
                        name: LanguageConstants.applicationSetting.tr),
                    DividerWidget(isCenterGradient: true),
                    Profiletile(
                        onPressed: () {
                          Get.toNamed(Routes.Manageaddress);
                        },
                        image: styles.appicon.manageaddress,
                        name: LanguageConstants.manageAddress.tr),
                    DividerWidget(isCenterGradient: true),
                    Profiletile(
                        onPressed: () {
                          Get.toNamed(Routes.Billingscreen);
                        },
                        image: styles.appicon.billing,
                        name: LanguageConstants.billing.tr),
                    DividerWidget(isCenterGradient: true),
                    Profiletile(
                        onPressed: () {
                          Get.toNamed(Routes.Subscriptionview);
                        },
                        image: styles.appicon.subscription,
                        name: LanguageConstants.subscription.tr),
                    DividerWidget(isCenterGradient: true),
                    Profiletile(
                        onPressed: () {
                          Get.toNamed(Routes.Privacypolicy);
                        },
                        image: styles.appicon.privacypolice,
                        name: LanguageConstants.privacyPolicy.tr),
                    DividerWidget(isCenterGradient: true),
                    Profiletile(
                        onPressed: () {
                          Get.toNamed(Routes.Contactandsupport);
                        },
                        image: styles.appicon.contactsupport,
                        name: LanguageConstants.contactSupport.tr),
                    DividerWidget(isCenterGradient: true),
                    Profiletile(
                        onPressed: () {
                          Get.dialog(Logoutdialog(
                            onPressed: () {
                              _auth.signOut().then((value) {
                                Get.toNamed(Routes.Loginview);
                              }).onError(
                                (error, stackTrace) {
                                  Utils().toastMessage(error.toString());
                                },
                              );
                            },
                            title: LanguageConstants.logout.tr,
                            subtitle: LanguageConstants.logout_confirmation.tr,
                            Buttonname: LanguageConstants.yes_logout.tr,
                          ));
                        },
                        image: styles.appicon.lockout,
                        name: LanguageConstants.logout.tr)
                  ])))
        ],
      )),
    );
  }
}
