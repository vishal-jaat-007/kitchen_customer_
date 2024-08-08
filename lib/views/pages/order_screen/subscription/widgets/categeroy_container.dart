part of '../subscription_order_imports.dart';

class _CategeroyContainer2 extends StatefulWidget {
  SubscriptionCategeroyModel data;
  final String selected;
  final void Function(String) onSelect;
  _CategeroyContainer2(
      {Key? key,
      required this.onSelect,
      required this.selected,
      required this.data})
      : super(key: key);

  @override
  _CategeroyContainer2State createState() => _CategeroyContainer2State();
}

class _CategeroyContainer2State extends State<_CategeroyContainer2> {
  SingleTonClass styles = SingleTonClass.instance;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    return GestureDetector(
      onTap: () {
        widget.onSelect(widget.data.id.toString());
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.selected == widget.data.id.toString()
                ? styles.appcolors.whitecolor
                : styles.appcolors.black20,
          ),
          color: widget.selected == widget.data.id.toString()
              ? styles.appcolors.primarycolor
              : controller.isDarkMode()
                  ? styles.appcolors.darktheme_highlight
                  : styles.appcolors.whitecolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.data.title,
                  style: styles.textthme.fs16_semibold.copyWith(
                    color: widget.selected == widget.data.id.toString()
                        ? styles.appcolors.whitecolor
                        : controller.isDarkMode()
                            ? styles.appcolors.whitecolor
                            : styles.appcolors.blackcolor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: widget.selected == widget.data.id.toString()
                              ? styles.appcolors.whitecolor
                              : controller.isDarkMode()
                                  ? styles.appcolors.whitecolor
                                  : styles.appcolors.blackcolor)),
                  child: Icon(
                    Icons.check,
                    color: widget.selected == widget.data.id.toString()
                        ? styles.appcolors.whitecolor
                        : controller.isDarkMode()
                            ? styles.appcolors.whitecolor
                            : styles.appcolors.blackcolor,
                    size: 15,
                  ),
                )
              ],
            ),
            Gap(10),
            Text(
              " ₹ ${widget.data.totalprice.toString()}/  ${LanguageConstants.meal.tr}",
              style: styles.textthme.fs16_regular.copyWith(
                color: widget.selected == widget.data.id.toString()
                    ? styles.appcolors.whitecolor
                    : controller.isDarkMode()
                        ? styles.appcolors.whitecolor
                        : styles.appcolors.blackcolor,
              ),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " ${widget.data.days.toString()} ${LanguageConstants.fullMeals.tr}",
                  style: styles.textthme.fs16_regular.copyWith(
                    color: widget.selected == widget.data.id.toString()
                        ? styles.appcolors.whitecolor
                        : controller.isDarkMode()
                            ? styles.appcolors.whitecolor
                            : styles.appcolors.blackcolor,
                  ),
                ),
                Text(
                  "${LanguageConstants.total.tr} ₹ ${widget.data.totalprice.toString()} ",
                  style: styles.textthme.fs16_semibold.copyWith(
                    color: widget.selected == widget.data.id.toString()
                        ? styles.appcolors.whitecolor
                        : controller.isDarkMode()
                            ? styles.appcolors.whitecolor
                            : styles.appcolors.blackcolor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
