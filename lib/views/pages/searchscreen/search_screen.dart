part of 'search.dart';

class SearchView extends StatelessWidget {
  
  SearchView({super.key});
  SingleTonClass styles = SingleTonClass.instance;
  @override
  Widget build(BuildContext context) {
     final controller = Get.find<ThemeController>();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Gap(15),

            /// *******  Search Dishes Text Filled *********** ///
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back(canPop: true);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Gap(5),
                Expanded(
                  child: SearchTextField(
                    shadow: true,
                    ontap: () {},
                    readOnly: false,
                  ),
                ),
              ],
            ),
            Gap(5),
            Row(
              children: [
                Expanded(
                  child: Text(
                    LanguageConstants.recentSearch.tr,
                    style: styles.textthme.fs16_regular,
                  ),
                ),
                TransprntBtn(
                  onPressed: () {},
                  text: "Clear All",
                  style: styles.textthme.fs16_regular
                      .copyWith(color: styles.appcolors.primarycolor),
                )
              ],
            ),

            /// *******  Resent Search History  *********** ///
            Gap(5),
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: controller.isDarkMode()
                      ? styles.appcolors.darktheme_highlight
                      : styles.appcolors.whitecolor),
              child: Column(
                children: [
                  ...List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.all(6.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LanguageConstants.eggWithAvocado.tr,
                            style: styles.textthme.fs16_regular.copyWith(
                                color: controller.isDarkMode()
                                    ? styles.appcolors.whitecolor
                                    : styles.appcolors.black50),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              styles.appicon.croos,
                              scale: 4,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
