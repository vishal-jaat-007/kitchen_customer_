part of 'Application.dart';
class Changenotification extends StatefulWidget {
  const Changenotification({super.key});

  @override
  State<Changenotification> createState() => _ChangenotificationState();
}

class _ChangenotificationState extends State<Changenotification> {
  int? currentindex = 0;
  void _handleSwitchChanged(int index, bool value) {
    setState(() {
      if (value) {
        currentindex = index;
      } else if (currentindex == index) {
        currentindex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(titleText: LanguageConstants.notification.tr),
      body: ListView(
        children: [
          Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Containerwidget(
              child: Column(children: [
                SwitchAdaptivetile(
                    value: currentindex == 0,
                    onChanged: (value) => _handleSwitchChanged(0, value),
                    title: LanguageConstants.sound.tr),
                DividerWidget(isCenterGradient: true),
                Gap(10),
                SwitchAdaptivetile(
                    value: currentindex == 1,
                    onChanged: (value) => _handleSwitchChanged(1, value),
                    title: LanguageConstants.vibrate.tr),
                DividerWidget(isCenterGradient: true),
                Gap(10),
                SwitchAdaptivetile(
                    value: currentindex == 2,
                    onChanged: (value) => _handleSwitchChanged(2, value),
                    title: LanguageConstants.mute.tr),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
