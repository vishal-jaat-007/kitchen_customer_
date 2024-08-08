part of 'Application.dart';

class Applicationsetting extends StatelessWidget {
  const Applicationsetting({super.key});

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.applicationSetting.tr),
      body: ListView(
        children: [
          Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Containerwidget(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(children: [
                Profiletile(
                    onPressed: () {
                      Get.toNamed(Routes.Changetheme);
                    },
                    image: styles.appicon.changetheme,
                    name: LanguageConstants.change_theme.tr),
                DividerWidget(isCenterGradient: true),
                Profiletile(
                    onPressed: () {
                      Get.toNamed(Routes.Changelanguage);
                    },
                    image: styles.appicon.language,
                    name: LanguageConstants.language.tr),
                DividerWidget(isCenterGradient: true),
                Profiletile(
                    onPressed: () {
                      Get.toNamed(Routes.changenotification);
                    },
                    image: styles.appicon.notification,
                    name: LanguageConstants.notification.tr)
              ]),
            ),
          )
        ],
      ),
    );
  }
}
