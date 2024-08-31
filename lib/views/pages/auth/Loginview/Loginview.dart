part of "login.dart";

class Loginview extends StatefulWidget {
  Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _addtime = TextEditingController();
  final _db = Get.find<ProductController>();
  bool loading = false;

  @override
  void dispose() {
    // _email.dispose();
    // _password.dispose();
    super.dispose();
  }

  // Future<void> login() async {
  //   if (_globalKey.currentState!.validate()) {
  //     setState(() {
  //       loading = true;
  //     });

  //     try {
  //       await _auth.signInWithEmailAndPassword(
  //         email: _email.text.trim(),
  //         password: _password.text.trim(),
  //       );
  //       // Navigate to the OTP verification page on successful login
  //       Get.toNamed(Routes.CompleteYourProfile);
  //     } on FirebaseAuthException catch (error) {
  //       // Display error message to the user
  //       Utils().toastMessage(error.message ?? "An error occurred");
  //     } finally {
  //       setState(() {
  //         loading = false;
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    return Scaffold(
        body: Form(
            key: _globalKey,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ListView(children: [
                  Gap(80),
                  Column(children: [
                    Image.asset(styles.appimg.dabbawala,
                        height: Appservices.getScreenHeight() * 0.33),
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
                              controller: _name,
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
                              controller: _price,
                              validator: PasswordValidator(),
                              hinttext: LanguageConstants.enteryourpassword.tr),
                          Gap(5),
                          Textfieldwidget(
                              controller: _addtime,
                              validator: PasswordValidator(),
                              hinttext: LanguageConstants.enteryourpassword.tr),
                          GetBuilder<ProductController>(
                            builder: (controller) => Column(
                              children: List.generate(
                                  controller.product.length,
                                  (index) => ListTile(
                                        title: Text(
                                            controller.product[index].name!),
                                        subtitle: Text(
                                            controller.product[index].price!),
                                      )),
                            ),
                          )
                        ]),
                    Gap(25),
                    // ---Primary button---
                    Row(children: [
                      Primarybtn(
                          loading: loading,
                          name: LanguageConstants.logIn.tr,
                          onPressed: () =>
                              //  _db.addproduct(generateData()),
                              _db.delete("price", "lgyhrjxz6ak9vSXQBEwr"),
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

                    // --google, facebook--
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(styles.appicon.facebook)),
                      Gap(12),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(styles.appicon.google))
                    ]),
                    Gap(22),
                  ])
                ]))));
  }

  ProductModel generateData() {
    return ProductModel(
        name: _name.text, price: _price.text, addtime: _addtime.text);
  }
}
