import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/class/firebase_handler.dart';
import 'package:tiffin_service_customer/view_model/model/product_model.dart';

class ProductController extends GetxController {
  final _firebasehandler = FirebaseHandler();
  final _firestore = FirebaseFirestore.instance;
  List<ProductModel> _product = [];
  List<ProductModel> get product => _product;
  setproduct(List<ProductModel> data) {
    data = product;
    update();
  }



  addproduct(ProductModel data) async {
    try {   
      final db = await _firebasehandler.postData(
          response.SET, data.toproduct(), _firestore.collection("Productdata"));
      if (db != null) {
        _product.add(ProductModel.fromproduct(db));
        update();
      } else {
        print("fjkjfdjfk");
      }
    } catch (e) {}
  }

  delete(String key,String doc) async {
    final db = _firestore
        .collection("Productdata")
        .doc(doc)
        .update({key: FieldValue.delete()});
    return db;
  }
}
