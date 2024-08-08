import 'package:tiffin_service_customer/singletonClasses/singleton.dart';

class CategoryModel {
  int id;
  String image, foodtype, foodname;
  int like;
  double rating;
  double price;
  int  quantity;

  CategoryModel({
    required this.id,
    required this.image,
    required this.foodtype,
    required this.foodname,
    required this.like,
    required this.rating,
    required this.price,
    this.quantity = 1,
  });
} 
SingleTonClass styles = SingleTonClass.instance;

class CategoryModelData { 

  var categoryData = <CategoryModel>[
    CategoryModel(
        id: 1,
        image: styles.appimg.northindianmeal,
        foodtype: "North Indian Meal",
        foodname: "Soy, Rice, Bell pepper, Peanuts",
        like: 90,
        rating: 8.9,
        price: 40,
        quantity: 1),
    CategoryModel(
        id: 2,
        image: styles.appimg.northindianmeal,
        foodtype: "South Indian Meal",
        foodname: "Dosa, Sambar, Coconut Chutney",
        like: 80,
        rating: 9.0,quantity: 1,
        price: 35),
    CategoryModel(
        id: 3,
        image: styles.appimg.northindianmeal,
        foodtype: "Chinese Meal",
        foodname: "Noodles, Manchurian",
        like: 85,
        rating: 8.5,quantity: 1,
        price: 50),
  ];
}
