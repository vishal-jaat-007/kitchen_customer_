part of 'Application.dart';

class Changelanguage extends StatefulWidget {
  const Changelanguage({super.key});

  @override
  State<Changelanguage> createState() => _ChangelanguageState();
}

class _ChangelanguageState extends State<Changelanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.language.tr),
      body: ListView(
        children: [
          Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Containerwidget(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: TranslationService.languages.length,
                    separatorBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: DividerWidget(isCenterGradient: true));
                    },
                    itemBuilder: (context, index) {
                      final language = TranslationService.languages[index];
                      return Obx(
                        () {
                          final controller = Get.find<LanguageController>();
                          return SwitchAdaptivetile(
                            title: language.languagename,
                            value: controller.selectedLanguage == language,
                            onChanged: (value) =>
                                controller.setLanguage(language),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
