part of "Subscription_view_imports.dart";

class Subscriptionview extends StatelessWidget {
  const Subscriptionview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.subscription.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
          // ---LISTVIEW SEPARATED --
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return Gap(15);
            },
            itemCount: SubscriptionCategeroyModeldata.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return subscription_container(
                onPressed: () {
                  Get.toNamed(Routes.Subscriptiondetails,
                      arguments: SubscriptionCategeroyModeldata[index]);
                },
                data: SubscriptionCategeroyModeldata[index],
              );
            },
          ),
        ]),
      ),
    );
  }
}
