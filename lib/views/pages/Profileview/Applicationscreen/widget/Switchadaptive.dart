import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

// ignore: must_be_immutable
class SwitchAdaptivetile extends StatefulWidget {
  String title;

  bool value;
  final ValueChanged<bool> onChanged;

  SwitchAdaptivetile({
    super.key,
    required this.onChanged,
    required this.title,
    required this.value,
  });

  @override
  State<SwitchAdaptivetile> createState() => _SecurityTileState();
}

class _SecurityTileState extends State<SwitchAdaptivetile> {
  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(widget.title, style: styles.textthme.fs16_regular),
          ),
          Switch.adaptive(
              splashRadius: 10,
              inactiveThumbColor: styles.appcolors.whitecolor,
              activeColor: styles.appcolors.whitecolor,
              activeTrackColor: styles.appcolors.primarycolor,
              inactiveTrackColor: styles.appcolors.black20,
              value: widget.value,
              onChanged: widget.onChanged)
        ]),
      ],
    );
  }
}
