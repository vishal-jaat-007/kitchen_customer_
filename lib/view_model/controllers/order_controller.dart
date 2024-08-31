import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/utils/Apis/order_api.dart';
import 'package:tiffin_service_customer/view_model/controllers/user_controller.dart';

class OrderController extends GetxController {
  final UserController _userController = Get.find<UserController>();

  Future<void> placeOrder() async {
    try {
      final userId = _userController.user.uid;

      final items = [
        {'itemName': 'North Indian Meal', 'quantity': 1, 'price': 170.0},
        {'itemName': 'Eggs with Avocado', 'quantity': 1, 'price': 120.0},
        {'itemName': 'Poha', 'quantity': 1, 'price': 70.0},
        {'itemName': 'Jain Fry', 'quantity': 1, 'price': 50.0},
      ];

      // Calculate the total price
      final totalPrice = items.fold(
          0.0,
          (sum, item) =>
              sum + (item['price'] as double) * (item['quantity'] as int));

      final deliveryAddress = {
        'houseNo': '123',
        'addressTitle': 'Home',
        'contactName': 'John Doe',
        'contactNumber': '1234567890',
        'latitude': 12.9715987,
        'longitude': 77.5945627,
      };

      await OrderApi.generateOrder(
        userId: userId,
        items: items,
        totalPrice: totalPrice,
        deliveryAddress: deliveryAddress,
      );

      // Fetch updated list of orders
      final orders = await OrderApi.fetchUserOrders(userId: userId);
      print("Orders: $orders");
    } catch (e) {
      print('Error placing order: $e');
    }
  }
}
