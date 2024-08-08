import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';

class FoodController extends GetxController {
  var categoryList = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    var data = CategoryModelData().categoryData;
    categoryList.addAll(data);
  }

  void incrementQuantity(int index) {
    categoryList[index].quantity++;
    categoryList.refresh(); // Notify the UI about the update
  }

  void decrementQuantity(int index) {
    if (categoryList[index].quantity > 1) {
      categoryList[index].quantity--;
      categoryList.refresh(); // Notify the UI about the update
    }
  }
}
