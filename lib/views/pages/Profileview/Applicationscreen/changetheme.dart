part of 'Application.dart';

class Changetheme extends StatefulWidget {
  const Changetheme({super.key});

  @override
  State<Changetheme> createState() => _ChangethemeState();
}

class _ChangethemeState extends State<Changetheme> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.change_theme.tr),
      body: ListView(
        children: [
          Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Containerwidget(
              child: Column(children: [
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      final theme = controller.themes[i];
                      return Obx(() => SwitchAdaptivetile(
                          value: controller.currentTheme == theme,
                          onChanged: (value) =>
                              controller.setCurrentTheme(theme),
                          title: theme.title.tr));
                    },
                    separatorBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: DividerWidget(isCenterGradient: true),
                      );
                    },
                    itemCount: controller.themes.length)
              ]),
            ),
          )
        ],
      ),
    );
  }
}
