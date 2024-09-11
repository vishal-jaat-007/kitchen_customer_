import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/backend/network/backend/Firebaseresponse.dart';
import 'package:tiffin_service_customer/view_model/model/ordermodel/OrderModel.dart';

class Ordercontroller extends GetxController {
  final _firebasehandler = FirebaseResponseHandler(); 
  final _firestore = FirebaseFirestore.instance;

  RxList<Ordermodel> _orderdata = <Ordermodel>[].obs;
  RxList<Ordermodel> get orderdata => _orderdata;
  setdata(RxList<Ordermodel> data) {
    data = orderdata;
    update();
  }

  addorder(Map<String, dynamic> data) async {
    try {
      final db =
          await _firebasehandler.postData(_firestore.collection("order"), data);
      _orderdata = Ordermodel.fromjson(data, db!.docId) as RxList<Ordermodel>;
    } catch (e) {
      print(e.toString());
    }
  }
}
