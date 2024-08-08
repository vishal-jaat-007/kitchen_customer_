part of 'order_.dart';

class OneTimeOrderscreen extends StatefulWidget {
  final CategoryModel category;
  OneTimeOrderscreen({super.key, required this.category});

  @override
  State<OneTimeOrderscreen> createState() => _OneTimeOrderscreenState();
}

class _OneTimeOrderscreenState extends State<OneTimeOrderscreen> {
  List<Map<String, dynamic>> days = [
    {"days": LanguageConstants.mon.tr},
    {"days": LanguageConstants.tue.tr},
    {"days": LanguageConstants.wed.tr},
    {"days": LanguageConstants.thu.tr},
    {"days": LanguageConstants.fri.tr},
    {"days": LanguageConstants.sat.tr}
  ];
  SingleTonClass styles = SingleTonClass.instance;

  final RxBool _isOneTimeOrderSelected = true.obs;
  final RxBool _isSubscriptionSelected = false.obs;

  final FoodController foodController = Get.find<FoodController>();
  final CounterController counterController = Get.find<CounterController>();
  final AddonController addonController = Get.find<AddonController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addonController.addons.value = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();

    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.Back),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15)
            .copyWith(top: 0),
        children: [
          // Menu button
          MenuBtnwidget(),

          // Checkboxes
          Row(
            children: [
              Expanded(
                child: Obx(() => CustomCheckboxListTile(
                      value: _isOneTimeOrderSelected.value,
                      title: LanguageConstants.oneTimeOrder.tr,
                      onChanged: (bool? value) {
                        _isOneTimeOrderSelected.value = value!;
                        if (_isOneTimeOrderSelected.value) {
                          _isSubscriptionSelected.value = false;
                        }
                      },
                    )),
              ),
              Expanded(
                child: Obx(() => CustomCheckboxListTile(
                      value: _isSubscriptionSelected.value,
                      title: LanguageConstants.subscription.tr,
                      onChanged: (bool? value) {
                        _isSubscriptionSelected.value = value!;
                        if (_isSubscriptionSelected.value) {
                          _isOneTimeOrderSelected.value = false;
                        }
                      },
                    )),
              ),
            ],
          ),

          // Conditional rendering based on checkbox selection
          Obx(() {
            if (_isOneTimeOrderSelected.value) {
              return Column(
                children: [
                  Containerwidget(
                    showPadding: false,
                    shadow: false,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10.r),
                              bottom: Radius.circular(20.r)),
                          child: Image.asset(widget.category.image),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.category.foodtype,
                                    style: styles.textthme.fs20_semibold
                                        .copyWith(
                                            color: controller.isDarkMode()
                                                ? styles.appcolors.whitecolor
                                                : styles.appcolors.blackcolor),
                                  ),
                                  Text(
                                    "₹${widget.category.price}/-",
                                    style: styles.textthme.fs20_semibold
                                        .copyWith(
                                            color:
                                                styles.appcolors.primarycolor),
                                  ),
                                ],
                              ),
                              Gap(5),
                              Text(
                                widget.category.foodname,
                                style: styles.textthme.fs14_regular.copyWith(
                                    color: controller.isDarkMode()
                                        ? styles.appcolors.whitecolor
                                            .withOpacity(0.5)
                                        : styles.appcolors.black60),
                              ),
                              Gap(10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LikeStarWidget(
                                    showrating: true,
                                    iconSize: 20,
                                    color: styles.appcolors.primarycolor,
                                  ),
                                ],
                              ),
                              Gap(10),

                              // Increment decrement buttons
                              IconBtn(
                                countervalue: counterController.counter,
                                iconcolr: styles.appcolors.blackcolor,
                                bgcolr: styles.appcolors.lightpink,
                                onDecrement: counterController.decrement,
                                onIncrement: counterController.increment,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(15),

                  // Customize Item button
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Primarybtn(
                      name: "Customize Item",
                      onPressed: showAddonsPopup,
                      height: 0,
                    )
                  ]),

                  Gap(15),
                  CompleteYourMealwidget(),
                  Gap(18),

                  // Grand Total
                  Obx(() {
                    if (addonController.addons.isNotEmpty) {
                      return Column(
                        children: [
                          Gap(15),
                          TitleBar(title: LanguageConstants.grandTotal.tr),
                          Gap(15),
                          Containerwidget(
                            shadow: false,
                            child: Column(
                              children: [
                                GrandTotalDetailTile(
                                  title: LanguageConstants.tiffinBasePrice.tr,
                                  price: "₹140 /-",
                                ),
                                Gap(10),
                                Row(
                                  children: [
                                    Expanded(child: DividerWidget()),
                                    Gap(10),
                                    Text(
                                      "+ ${LanguageConstants.addons.tr}",
                                      style:
                                          styles.textthme.fs16_medium.copyWith(
                                        color: controller.isDarkMode()
                                            ? styles.appcolors.whitecolor
                                            : styles.appcolors.blackcolor,
                                      ),
                                    ),
                                    Gap(10),
                                    Expanded(
                                      child: Transform.rotate(
                                        angle: pi,
                                        child: DividerWidget(),
                                      ),
                                    ),
                                  ],
                                ),
                                for (var addon in addonController.addons) ...[
                                  Gap(10),
                                  GrandTotalDetailTile(
                                    title: addon['title'],
                                    price: "₹${addon['price']} /-",
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
                  Gap(15),
                ],
              );
            } else if (_isSubscriptionSelected.value) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return Gap(15);
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 15.sp, top: 15.sp),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return Weeklymenutile(days: days[index]["days"]);
                },
              );
            } else {
              return SizedBox();
            }
          }),

          // Offers and Benefits
          TitleBar(title: LanguageConstants.offersBenefits.tr),
          Gap(15),
          Containerwidget(
            showborder: true,
            shadow: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${LanguageConstants.Save_more_on_your_order.tr}",
                        style: styles.textthme.fs14_regular,
                      ),
                      Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "20% ${LanguageConstants.off.tr} on your order ",
                                style: styles.textthme.fs12_regular.copyWith(
                                    color: controller.isDarkMode()
                                        ? styles.appcolors.whitecolor
                                        : styles.appcolors.black60),
                              ),
                              Text(
                                "${LanguageConstants.KITCHEN.tr}20",
                                style: styles.textthme.fs12_regular.copyWith(
                                    color: styles.appcolors.primarycolor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Primarybtn(
                  name: "${LanguageConstants.Apply.tr}",
                  onPressed: coupondilog,
                  height: 5,
                ),
              ],
            ),
          ),
          Gap(15),

          // Total and Pay Now button
          Containerwidget(
            shadow: false,
            child: Column(
              children: [
                DividerWidget(isCenterGradient: true),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${LanguageConstants.total.tr} ₹250 ",
                      style: styles.textthme.fs20_semibold,
                    ),
                    Gap(50),
                    Primarybtn(
                      name: "${LanguageConstants.payNow.tr}",
                      height: 15,
                      onPressed: handlePayNow,
                      isExpanded: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void handlePayNow() {
    if (_isOneTimeOrderSelected.value) {
      Get.bottomSheet(
          backgroundColor: controller.isDarkMode()
              ? styles.appcolors.darktheme_highlight
              : styles.appcolors.whitecolor,
          Container(
            constraints: BoxConstraints(maxHeight: 155.h),
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: Column(
              children: [
                Text(
                    "By continuing, you agree to our Terms of Service, Privacy Policy and Non- Refundable amount T&C.  ",
                    style: styles.textthme.fs14_semibold,
                    textAlign: TextAlign.center),
                Gap(20),
                DividerWidget(isCenterGradient: true),
                Gap(20),
                Row(
                  children: [
                    Primarybtn(
                        radius: 100,
                        name: "Disagree",
                        foregroundColor: styles.appcolors.primarycolor,
                        borderclr: styles.appcolors.primaryColorLight,
                        backgroundColor: styles.appcolors.primaryColorLight,
                        onPressed: () {
                          Get.back();
                        },
                        isExpanded: true),
                    Gap(15),
                    Primarybtn(
                        name: "Agree",
                        onPressed: () {
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
                                          Get.offAllNamed(
                                              Routes.bottomnavigationbar);
                                        },
                                        isExpanded: true,
                                        radius: 100,
                                        borderclr: styles.appcolors.lightpink,
                                        backgroundColor:
                                            styles.appcolors.lightpink,
                                        foregroundColor:
                                            styles.appcolors.primarycolor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        radius: 100,
                        isExpanded: true)
                  ],
                )
              ],
            ),
          ));
    } else if (_isSubscriptionSelected.value) {
      Get.toNamed(Routes.SubscriptionOrderscreen);
    }
  }
}
