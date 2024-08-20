part of "login.dart";

class Loginview extends StatefulWidget {
  Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (_globalKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });

      try {
        await _auth.signInWithEmailAndPassword(
          email: _email.text.trim(),
          password: _password.text.trim(),
        );
        // Navigate to the OTP verification page on successful login
        Get.toNamed(Routes.CompleteYourProfile);
      } on FirebaseAuthException catch (error) {
        // Display error message to the user
        Utils().toastMessage(error.message ?? "An error occurred");
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;

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
                  // ---input fields---
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
                            validator: EmailValidator(),
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
                            validator: PasswordValidator(),
                            hinttext: LanguageConstants.enteryourpassword.tr)
                      ]),
                  Gap(25),
                  // ---Primary button---
                  Row(children: [
                    Primarybtn(
                      loading: loading,
                      name: LanguageConstants.logIn.tr,
                      onPressed: () async {
                        if (_globalKey.currentState!.validate()) {
                          await AuthDataHandler().login(
                            email: _email.text,
                            password: _password.text,
                          );
                        }
                      },
                      isExpanded: true,
                    ),
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
                  // --google, facebook--
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
