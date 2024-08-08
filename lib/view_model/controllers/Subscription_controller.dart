import 'package:get/get.dart';

class RadioController extends GetxController {
  var selectedValue = ''.obs;

  void selectValue(String value) {
    selectedValue.value = value;
  }
}