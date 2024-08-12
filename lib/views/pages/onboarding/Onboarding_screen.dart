part of "Onboarding.dart";

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();
    FirebaseAuth _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    return Scaffold(
      body: Container(
        width: Appservices.getScreenWidth(),
        height: Appservices.getScreenHeight(),
        decoration: BoxDecoration(
          gradient: controller.isDarkMode()
              ? LinearGradient(begin: Alignment.topCenter, colors: [
                  styles.appcolors.darktheme_highlight,
                  styles.appcolors.darktheme_highlight,
                  styles.appcolors.darktheme_highlight,
                  styles.appcolors.darktheme_highlight.withOpacity(0.29)
                ])
              : LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    styles.appcolors.primaryColorLight,
                    styles.appcolors.primaryColorLight,
                    styles.appcolors.primaryColorLight,
                    styles.appcolors.primaryColorLight.withOpacity(0.3),
                  ],
                ),
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset(
              styles.appimg.onboarding_bg,
              height: Appservices.getScreenHeight() * 0.7,
              width: Appservices.getScreenWidth(),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Text(LanguageConstants.foodLikeHome.tr,
                      style: styles.textthme.fs40_medium.copyWith(
                          color: controller.isDarkMode()
                              ? styles.appcolors.whitecolor
                              : styles.appcolors.blackcolor)),
                  Gap(7),
                  Text(LanguageConstants.enjoyYourMealToday.tr,
                      style: styles.textthme.fs16_regular.copyWith(
                          color: controller.isDarkMode()
                              ? styles.appcolors.whitecolor
                              : styles.appcolors.black50)),
                  Gap(15),
                  Row(children: [
                    Primarybtn(
                        name: LanguageConstants.getStarted.tr,
                        onPressed: () {
                          if (user != null) {
                            Get.toNamed(Routes.bottomnavigationbar);
                          } else {
                            Get.toNamed(Routes.Loginview);
                          }
                        },
                        isExpanded: true)
                  ]),
                  Gap(15),
                  TextrichWidget(
                      onPressed: () {
                        Get.toNamed(Routes.Loginview);
                      },
                      subtitle: LanguageConstants.logIn.tr,
                      title: LanguageConstants.alreadyHaveAnAccount.tr)
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
