part of '../profile.dart';

// ignore: unused_element
class Profilewidget extends StatelessWidget {
  Profilewidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
     final controller = Get.find<ThemeController>();
    return Stack(alignment: Alignment(0, -1.8), children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Containerwidget(
            child: Column(children: [
          Gap(55),
          Text("Navdeep", style: styles.textthme.fs18_medium),
          Gap(5),
          Text("navdeepghanghas5109@gmail.com",
              style: styles.textthme.fs16_regular),
          Gap(20),
          Row(children: [
            Primarybtn(
                isExpanded: true,
                name: LanguageConstants.editProfile.tr,
                onPressed: () {
                  Get.toNamed(Routes.Profileeditscreen);
                },
                foregroundColor: styles.appcolors.primarycolor,
                backgroundColor: controller.isDarkMode()
                    ? styles.appcolors.darktheme_highlight
                    : styles.appcolors.whitecolor)
          ]),
        ])),
      ),
      ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(styles.appimg.Profileimg,
              height: 100, width: 100, fit: BoxFit.cover))
    ]);
  }
}
