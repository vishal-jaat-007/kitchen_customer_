import 'package:get/get.dart';

class AddonController extends GetxController {
  var rotiSelected = false.obs;
  var jeeraRaytaSelected = false.obs;
  var dahiSelected = false.obs;
  var addons = <Map<String, dynamic>>[].obs;
  var grandTotal = 140.obs;

  void addAddon(String title, int price, bool selected) {
    int index = addons.indexWhere((e) => e['title'] == title);
    if (selected) {
      if (index == -1) {
        addons.add({'title': title, 'price': price});
      } else {
        addons[index] = {'title': title, 'price': price};
      }
    } else {
      if (index != -1) {
        addons.removeAt(index);
      }
    }
    calculateGrandTotal();
  }

  void calculateGrandTotal() {
    grandTotal.value = 140; // Base price
    for (var addon in addons) {
      grandTotal.value += addon['price'] as int;
    }
  }
}
