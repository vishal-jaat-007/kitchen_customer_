// ignore_for_file: unused_element

part of '../login.dart';

class _Intlphonefield extends StatelessWidget {
  _Intlphonefield();

  @override
  Widget build(BuildContext context) {
    SingleTonClass styles = SingleTonClass.instance;

    return IntlPhoneField(
      validator: (value) => TextValidator()
          .validate(LanguageConstants.phoneNumber.tr, value!.number),
      showCountryFlag: false,
      languageCode: "IN".tr,
      dropdownIconPosition: IconPosition.trailing,
      dropdownIcon: Icon(Icons.arrow_drop_down_outlined,
          color: styles.appcolors.blackcolor),
      flagsButtonPadding: EdgeInsets.only(left: 20),
      dropdownTextStyle: styles.textthme.fs16_regular,
      decoration: PrimaryDecorations.primaryTextFieldDecoration
          .copyWith( labelText: LanguageConstants.enterMobileNumber.tr),
      style: styles.textthme.fs16_regular
          .copyWith(color: styles.appcolors.black50),
      initialCountryCode: 'IN'.tr,
      onChanged: (phone) {}
    );
  }
}
