part of 'home.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final RxBool isListView = true.obs; // Observable boolean to toggle views
  final RxString selectedMenu = LanguageConstants.breakfast.tr.obs;
  final RxInt selectedView = 0.obs; // Observable to track the selected icon

  final FoodController foodController = Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    final controller = Get.find<ThemeController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header code remains the same
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 240.h,
                width: Appservices.getScreenWidth(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.centerRight,
                    image: AssetImage(styles.appimg.dashboardimage),
                    scale: 4,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [
                      styles.appcolors.orangecolor,
                      styles.appcolors.darkorange,
                      styles.appcolors.darkorange,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.w,
                      ),
                      title: Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: styles.appcolors.whitecolor, size: 24),
                          Gap(5),
                          Text(LanguageConstants.home.tr,
                              style: styles.textthme.fs20_semibold.copyWith(
                                  color: styles.appcolors.whitecolor)),
                        ],
                      ),
                      subtitle: Text(
                        "B-677, Sector 14, Hisar",
                        style: styles.textthme.fs12_regular
                            .copyWith(color: styles.appcolors.whitecolor),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.notification);
                        },
                        icon: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: styles.appcolors.whitecolor.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            styles.appicon.notification,
                            color: styles.appcolors.whitecolor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: SearchTextField(
                        ontap: () {
                          Get.toNamed(Routes.Searchscreen);
                        },
                      ),
                    ),
                    Gap(60),
                  ],
                ),
              ),
            ),

            // Current order list code remains the same
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              child: Column(
                children: [
                  TitleBar(title: LanguageConstants.Currentorder.tr),
                  Gap(15),
                  Containerwidget(
                    showborder: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.sp,
                      vertical: 10.sp,
                    ),
                    borderclr: styles.appcolors.primarycolor,
                    shadow: false,
                    child: Row(
                      children: [
                        Image.asset(styles.appimg.meal,
                            width: 103, height: 100),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      LanguageConstants.northIndianMeal.tr,
                                      style: styles.textthme.fs20_semibold
                                          .copyWith(
                                              overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  Expanded(
                                    child: LikeStarWidget(
                                      color: styles.appcolors.primarycolor,
                                      showrating: false,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(5),
                              Text(
                                "${LanguageConstants.soy.tr}${LanguageConstants.bellPaper.tr}${LanguageConstants.peanuts.tr}",
                                maxLines: 1,
                                style: styles.textthme.fs14_regular.copyWith(
                                  color: controller.isDarkMode()
                                      ? styles.appcolors.whitecolor
                                          .withOpacity(0.4)
                                      : styles.appcolors.black50,
                                ),
                              ),
                              Gap(10),
                              Text(
                                "${LanguageConstants.arrivingAt.tr} 25-30 mins",
                                style: styles.textthme.fs12_regular.copyWith(
                                    color: styles.appcolors.primarycolor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Today's offer list code remains the same
                  Gap(15),
                  TitleBar(title: LanguageConstants.todaysOffer.tr),
                  Gap(15),
                  SizedBox(
                    height: 130.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Gap(10);
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return OfferContainer();
                      },
                    ),
                  ),
                  Gap(15),
                  Row(
                    children: [
                      Expanded(
                        child: TitleBar(title: LanguageConstants.Todaymenu.tr),
                      ),
                      Obx(
                        () => Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                isListView.value = true;
                                selectedView.value = 0;
                              },
                              icon: Icon(Icons.grid_goldenratio_sharp,
                                  color: selectedView.value == 0
                                      ? styles.appcolors.primarycolor
                                      : styles.appcolors.blackcolor),
                            ),
                            IconButton(
                              onPressed: () {
                                isListView.value = false;
                                selectedView.value = 1;
                              },
                              icon: Icon(Icons.grading_sharp,
                                  color: selectedView.value == 1
                                      ? styles.appcolors.primarycolor
                                      : styles.appcolors.blackcolor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    children: List.generate(Todaymenubtn.length, (index) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Obx(
                            () => TextButton(
                              onPressed: () {
                                selectedMenu(Todaymenubtn[index].btnname);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6.w,
                                  vertical: 2.h,
                                ),
                                visualDensity: VisualDensity.compact,
                                backgroundColor: selectedMenu.value ==
                                        Todaymenubtn[index].btnname
                                    ? styles.appcolors.primarycolor
                                    : controller.isDarkMode()
                                        ? styles.appcolors.blackcolor
                                        : styles.appcolors.whitecolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  side: BorderSide(
                                    color: styles.appcolors.primarycolor,
                                  ),
                                ),
                              ),
                              child: Text(
                                Todaymenubtn[index].btnname,
                                style: styles.textthme.fs14_medium.copyWith(
                                  color: selectedMenu.value ==
                                          Todaymenubtn[index].btnname
                                      ? styles.appcolors.whitecolor
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  Obx(
                    () => isListView.value
                        ? ListView.separated(
                            separatorBuilder: (context, index) {
                              return Gap(15);
                            },
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 15.sp),
                            itemCount: foodController.categoryList.length,
                            itemBuilder: (context, index) {
                              return Todaymenucontainer(
                                menu: foodController.categoryList[index],
                              );
                            },
                          )
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7.h,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 15.sp),
                            itemCount: foodController.categoryList.length,
                            itemBuilder: (context, index) {
                              return Todaymenucontainer2(
                                menu: foodController.categoryList[index],
                              );
                            },
                          ),
                  ),
                  Gap(15),
                  Row(
                    children: [
                      Primarybtn(
                        name: "Order Your Meal",
                        onPressed: () {},
                        isExpanded: true,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Menubtn {
  String btnname;
  Menubtn(this.btnname);
}

//--------button---------data----//
var Todaymenubtn = [
  Menubtn(MealCategory.BREAKFAST.toString()),
  Menubtn(MealCategory.LUNCH.toString()),
  Menubtn(MealCategory.DINNER.toString()),
];
