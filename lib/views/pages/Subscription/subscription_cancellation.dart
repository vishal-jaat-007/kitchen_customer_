part of "Subscription_view_imports.dart";

class SubscriptionCancellation extends StatefulWidget {
  SubscriptionCategeroyModel data;
  SubscriptionCancellation({super.key, required this.data});

  @override
  State<SubscriptionCancellation> createState() =>
      _SubscriptionCancellationState();
}

class _SubscriptionCancellationState extends State<SubscriptionCancellation> {
  @override
  Widget build(BuildContext context) {
    // ---CONTROLLER--
    // ignore: unused_local_variable
    final RadioController controller = Get.put(RadioController());

    return Scaffold(
      appBar: PrimaryAppBar(
        titleText: LanguageConstants.cancelSubscription.tr,
        textcenter: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(children: [
          subscription_container(
              onPressed: () {}, data: widget.data, backgroundColor: true),
          Gap(15),
          Text(LanguageConstants.subscriptionEffective.tr,
              style: styles.textthme.fs12_regular),
          Gap(15),
          // ---CANCEL SUBSCRIPTION BTN--
          Primarybtn(
              foregroundColor: styles.appcolors.primaryColorLight,
              backgroundColor: styles.appcolors.transparent,
              borderclr: styles.appcolors.primaryColorLight,
              name: LanguageConstants.cancelSubscription,
              onPressed: () {}),
          Gap(15),
          Text(LanguageConstants.reasonForCancellation.tr,
              style: styles.textthme.fs16_regular),
          Gap(15),
          // ---RADIO BTN--
          Containerwidget(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              shadow: false,
              child: Column(children: [
                Radiobtn(title: LanguageConstants.notInterested.tr.tr),
                Radiobtn(title: LanguageConstants.betterOffers.tr),
                Radiobtn(title: LanguageConstants.movingLocation.tr),
                Radiobtn(title: LanguageConstants.notanymore.tr),
              ])),
          Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ---SUMBMIT REPORT BTN--
              Primarybtn(
                width: 40,
                name: LanguageConstants.submitReport.tr,
                onPressed: () {
                  Get.dialog(Subscriptiondialog(
                    details: LanguageConstants.membershipCancelled.tr,
                  ));
                },
              ),
            ],
          )
        ]),
      ),
    );
  }
}
