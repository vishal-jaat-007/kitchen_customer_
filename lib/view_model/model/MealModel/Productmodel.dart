// -------------
// ----------------MEAL MODEL------------
// ----------------------

class Productmodel {
  int mealId;
  String name;
  String description;
  int price;
  bool available;
  List<String> ingredients;
  NutritionInfo nutritionInfo;

  Productmodel({
    required this.mealId,
    required this.name,
    required this.description,
    required this.price,
    required this.available,
    required this.ingredients,
    required this.nutritionInfo,
  });

  factory Productmodel.fromJson(Map<String, dynamic> json) {
    return Productmodel(
      mealId: json['meal_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      available: json['available'],
      ingredients: List<String>.from(json['ingredients']),
      nutritionInfo: NutritionInfo.fromJson(json['nutrition_info']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meal_id': mealId,
      'name': name,
      'description': description,
      'price': price,
      'available': available,
      'ingredients': ingredients,
      'nutrition_info': nutritionInfo.toJson(),
    };
  }
}

// ------------------
// ---------- NUTRITION IFNO ------
// --------------------

class NutritionInfo {
  int calories;
  String protein;
  String fat;
  String carbohydrates;

  NutritionInfo({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
  });

  factory NutritionInfo.fromJson(Map<String, dynamic> json) {
    return NutritionInfo(
      calories: json['calories'],
      protein: json['protein'],
      fat: json['fat'],
      carbohydrates: json['carbohydrates'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbohydrates': carbohydrates,
    };
  }
}
