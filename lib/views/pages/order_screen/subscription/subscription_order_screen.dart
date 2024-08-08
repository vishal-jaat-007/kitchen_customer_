part of "subscription_order_imports.dart";

class SubscriptionOrderscreen extends StatefulWidget {
  const SubscriptionOrderscreen({super.key});

  @override
  State<SubscriptionOrderscreen> createState() =>
      _SubscriptionOrderscreenState();
}

class _SubscriptionOrderscreenState extends State<SubscriptionOrderscreen> {
  final RxString selected = "1".obs;
  SingleTonClass styles = SingleTonClass.instance;
  bool checkboxvalue = false;

  Rx<List<String>> selectedCategories = Rx<List<String>>([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.subscription.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Container(
          width: Appservices.getScreenWidth(),
          height: Appservices.getScreenHeight(),
          child: ListView(
            children: [
              TitleBar(title: "${LanguageConstants.category.tr}"),

              //-----------category------checkbox-------------------//
              Row(
                  children: List.generate(MealCategory.values.length, (i) {
                var meal = MealCategory.values[i];
                return Expanded(
                  child: Obx(() => CustomCheckboxListTile(
                        value: selectedCategories.value
                            .any((e) => e == meal.toString()),
                        title: "${meal.toString()}",
                        onChanged: (bool? value) {
                          if (value == true) {
                            selectedCategories
                                .update((v) => v!.add(meal.toString()));
                          } else {
                            selectedCategories
                                .update((v) => v!.remove(meal.toString()));
                          }
                        },
                      )),
                );
              })),

              //-----------------Plan-------------container-----------------//
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Gap(15);
                },
                itemCount: SubscriptionCategeroyModeldata.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Obx(() => _CategeroyContainer2(
                        data: SubscriptionCategeroyModeldata[index],
                        onSelect: (p0) {
                          selected.value = p0;
                        },
                        selected: selected.value,
                      ));
                },
              ),
              Gap(15),
              //-------------------calendar---------------//
              Containerwidget(shadow: false, child: DateRangePickerScreen()),

              //-------------------selectTimeSlots-------------//
              Obx(() => selectedCategories.value.isEmpty
                  ? SizedBox()
                  : Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: TitleBar(
                          title: "${LanguageConstants.selectTimeSlots.tr}"),
                    )),
              Gap(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => ListView.separated(
                        separatorBuilder: (context, index) {
                          return Gap(15);
                        },
                        shrinkWrap: true,
                        itemCount: timeSlots
                            .where((e) => selectedCategories.value.any(
                                (element) => element == e.category.toString()))
                            .length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return TimeSlotWidget(
                              timeSlot: timeSlots
                                  .where((e) => selectedCategories.value.any(
                                      (element) =>
                                          element == e.category.toString()))
                                  .toList()[index]);
                        },
                      ))
                ],
              ),
              Gap(15),

              //---------------Auto_Renew_Subscription----------//
              Containerwidget(
                shadow: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${LanguageConstants.Auto_Renew_Subscription.tr}",
                          style: styles.textthme.fs16_regular,
                        ),
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: styles.appcolors.primarycolor,
                          value: checkboxvalue,
                          onChanged: (value) {
                            setState(() {
                              checkboxvalue = value ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                    Gap(10),
                    DividerWidget(
                      isCenterGradient: true,
                    ),
                    Gap(10),
                    Row(
                      children: [
                        Text(
                          "${LanguageConstants.total.tr} ₹350 ",
                          style: styles.textthme.fs20_semibold,
                        ),
                        Gap(30),
                        Primarybtn(
                          name: "${LanguageConstants.payNow.tr}",
                          onPressed: () {
                            _alertdialog();
                          },
                          isExpanded: true,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Gap(10),
            ],
          ),
        ),
      ),
    );
  }

  //----------------alert------------dialog-------------------//
  void _alertdialog() {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        title: Column(
          children: [
            Image.asset(styles.appicon.checkicon),
            Gap(5),
            Text(
              "${LanguageConstants.bookingSuccessful.tr}",
              style: styles.textthme.fs18_semibold,
            ),
            Gap(10),
            Text(
              LanguageConstants.paymentBookingSuccess.tr,
              style: styles.textthme.fs16_regular,
              textAlign: TextAlign.center,
            ),
            Gap(15),
            Text(
              "${LanguageConstants.Order_id.tr}: 022478",
              style: styles.textthme.fs16_semibold,
            ),
            Gap(15),
            Row(
              children: [
                Primarybtn(
                  name: LanguageConstants.home.tr,
                  onPressed: () {
                    Get.toNamed(Routes.bottomnavigationbar);
                  },
                  isExpanded: true,
                  radius: 100,
                  borderclr: styles.appcolors.lightpink,
                  backgroundColor: styles.appcolors.lightpink,
                  foregroundColor: styles.appcolors.primarycolor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
