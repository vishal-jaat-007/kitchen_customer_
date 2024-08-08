import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/extension/string_extension.dart';

enum ApiStatus { LOADING, ERROR, PENDING, COMPLETE }

enum MealCategory {
  BREAKFAST,
  LUNCH,
  DINNER;

  @override
  String toString() => this.name.toTitleCase().tr;
}

enum Gender {
  MALE,
  FEMALE,
  OTHER;

  @override
  String toString() => this.name.toTitleCase().tr;
}
