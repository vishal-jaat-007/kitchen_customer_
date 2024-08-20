import 'package:get/get.dart';
import 'package:tiffin_service_customer/view_model/controllers/Subscription_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/add_on_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/chat_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/counter_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/food_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/language_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/user_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LanguageController());
    Get.put(ThemeController());
    Get.put(FoodController());
    Get.put(CounterController());
    Get.put(RadioController());
    Get.put(ChatController());
    Get.put(UserController());
    Get.put(AddonController(), permanent: true);
  }
}
