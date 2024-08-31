import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

class OrderModel {
  int id;
  String image, foodtype, foodname;
  double rating;
  double time;
  OrderModel({
    required this.id,
    required this.image,
    required this.foodtype,
    required this.foodname,
    required this.time,    
    required this.rating,
  });
}

SingleTonClass styles = SingleTonClass.instance;

var Ordermodeldata = [
  OrderModel(
      id: 1,
      image: styles.appimg.northindianmeal,
      foodtype: LanguageConstants.northIndianMeal.tr,
      foodname:
          "${LanguageConstants.soy.tr},${LanguageConstants.rice.tr},${LanguageConstants.peanuts.tr},",
      time: 1,
      rating: 4.2)
];
