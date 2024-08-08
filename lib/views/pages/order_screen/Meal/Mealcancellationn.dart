part of 'Meal.dart';

class Mealcancellationn extends StatefulWidget {
  const Mealcancellationn({super.key});

  @override
  State<Mealcancellationn> createState() => _MealcancellationnState();
}

class _MealcancellationnState extends State<Mealcancellationn> {
  final RxBool _isOneTimeOrderSelected = true.obs;

  final RxBool _isSubscriptionSelected = false.obs;

  // ---------one time order and subscription-----
  Widget handleradiobtn() {
    return Obx(
      () {
        if (_isSubscriptionSelected.value) {
          return Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Containerwidget(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                shadow: false,
                child: Column(children: [
                  Radiobtn(title: LanguageConstants.notInterested.tr),
                  Radiobtn(title: LanguageConstants.betterOffers.tr),
                  Radiobtn(title: LanguageConstants.movingLocation.tr),
                  Radiobtn(title: LanguageConstants.notanymore.tr),
                ])),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final RadioController controller = Get.put(RadioController());

    return Scaffold(
        appBar: PrimaryAppBar(
            titleText: LanguageConstants.mealCancellation.tr, textcenter: true),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              Gap(10),
              Text(LanguageConstants.reasonForCancellation.tr,
                  style: styles.textthme.fs16_regular),
              Gap(5),
              Row(children: [
                Expanded(
                    child: Obx(() => CustomCheckboxListTile(
                        value: _isOneTimeOrderSelected.value,
                        title: LanguageConstants.oneTimeOrder.tr,
                        onChanged: (bool? value) {
                          _isOneTimeOrderSelected.value = value!;
                          if (_isOneTimeOrderSelected.value) {
                            _isSubscriptionSelected.value = false;
                          }
                        }))),
                Expanded(
                    child: Obx(() => CustomCheckboxListTile(
                        value: _isSubscriptionSelected.value,
                        title: LanguageConstants.subscription.tr,
                        onChanged: (bool? value) {
                          _isSubscriptionSelected.value = value!;
                          if (_isSubscriptionSelected.value) {
                            _isOneTimeOrderSelected.value = false;
                          }
                        })))
              ]),
              handleradiobtn(),
              Gap(15),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Primarybtn(
                    width: 40,
                    name: LanguageConstants.submitReport.tr,
                    onPressed: () {
                      Get.dialog(Subscriptiondialog(
                          details: LanguageConstants.mealCancelled.tr));
                    })
              ])
            ]));
  }
}
