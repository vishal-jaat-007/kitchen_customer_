class ProductModel {
  String? id;
  String? name;
  String? price;
  String? addtime;
  String? updatetime;
  List<String>? image;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.addtime,
      this.updatetime,
      this.image});

  ProductModel.fromproduct(Firebasehandlermodel json)
      : id = json.id,
        name = json.data["name"],
        price = json.data["price"],
        addtime = json.data["addtime"] ?? DateTime.now().millisecondsSinceEpoch,
        updatetime = json.data["updatetime"],
        image = ((json.data["image"] ?? []) as List)
            .map((e) => e.toString())
            .toList();

  Map<String, dynamic> toproduct() {
    return {
      "id": id,
      "name": name ?? "",
      "price": price ?? "",
      "addtime": addtime ?? DateTime.now().millisecondsSinceEpoch,
      "updatetime": updatetime,
      "image": image ?? []
    };
  }

  // ----------------ORDER----
  Map<String, dynamic> toOrder() {
    return {"id": id, "name": name ?? "", "price": price ?? ""};
  }

  ProductModel.fromOrder(Firebasehandlermodel json)
      : id = json.data["id"],
        name = json.data["name"],
        price = json.data["price"];

  ProductModel copyWith({
    String? id,
    String? name,
    String? price,
    String? addtime,
    String? updatetime,
    List<String>? image,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      addtime: addtime ?? this.addtime,
      updatetime: updatetime ?? this.updatetime,
      image: image ?? this.image,
    );
  }
}

// ----------ORDER MODEL------
// -------------------
// --------------

class OrderModel {
  String? id;
  String? addtime;
  List<ProductModel>? Productdata;
  OrderModel({this.addtime, this.id, this.Productdata});
  OrderModel.fromjson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        addtime = json["addtime"],
        Productdata = ((json["Productdataa"] ?? []) as List)
            .map((e) => ProductModel.fromOrder(Firebasehandlermodel(e, "")))
            .toList();

  Map<String, dynamic> tomap() {
    return {
      "id": id ?? "",
      "addtime": addtime ?? DateTime.now().millisecondsSinceEpoch,
      "Productdata":
          Productdata!.isNotEmpty ? Productdata!.map((e) => e.toString()) : [],
    };
  }
}

// -----------------
// -----FIREBASEHANDLERMODEL---------
// -----------------
class Firebasehandlermodel {
  Map<String, dynamic> data;
  String id;
  Firebasehandlermodel(this.data, this.id);
}
