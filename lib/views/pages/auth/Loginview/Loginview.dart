part of "login.dart";

class Loginview extends StatelessWidget {
  Loginview({super.key});

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              Gap(80),
              Column(
                children: [
                  Image.asset(
                    styles.appimg.dabbawala,
                    height: Appservices.getScreenHeight() * 0.33,
                  ),
                  Gap(10),
                  Row(children: [
                    Expanded(child: Divider()),
                    Gap(15),
                    Text("${LanguageConstants.logIn.tr}",
                        style: styles.textthme.fs16_regular),
                    Gap(10),
                    Expanded(child: Divider())
                  ]),
                  Gap(20),
                  // ---intlephinefield--
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(LanguageConstants.email.tr,
                            style: styles.textthme.fs16_regular.copyWith(
                                color: controller.isDarkMode()
                                    ? styles.appcolors.whitecolor
                                    : styles.appcolors.black50)),
                        Gap(5),
                        Textfieldwidget(
                            controller: _email,
                            hinttext: LanguageConstants.Mail.tr),
                        Gap(10),
                        Text("Password",
                            style: styles.textthme.fs16_regular.copyWith(
                                color: controller.isDarkMode()
                                    ? styles.appcolors.whitecolor
                                    : styles.appcolors.black50)),
                        Gap(5),
                        Textfieldwidget(
                            controller: _password,
                            hinttext: LanguageConstants.enteryourpassword.tr)
                      ]),

                  // _Intlphonefield(),
                  Gap(25),
                  // ---Primary btn--
                  Row(children: [
                    Primarybtn(
                        name: LanguageConstants.logIn.tr,
                        onPressed: () {
                          if (_globalKey.currentState!.validate()) {
                            return Get.toNamed(Routes.Otpverfication);
                          }
                        },
                        isExpanded: true)
                  ]),
                  Gap(20),
                  TextrichWidget(
                      onPressed: () {
                        Get.toNamed(Routes.Signup);
                      },
                      subtitle: LanguageConstants.signUp.tr,
                      title:
                          "${LanguageConstants.or.tr} ${LanguageConstants.continueText.tr} ${LanguageConstants.withText.tr} "),

                  Gap(10),
                  // --google,facebook--
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(styles.appicon.facebook)),
                    Gap(12),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(styles.appicon.google)),
                  ]),
                  Gap(22),
                  // Text(
                  //   LanguageConstants.termsAndConditions.tr,
                  //   style: styles.textthme.fs12_regular,
                  //   textAlign: TextAlign.center,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
