import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiffin_service_customer/view_model/model/models.dart';
import 'package:tiffin_service_customer/view_model/model/product_model.dart';


enum response { ADD, SET, UPDATE }

class FirebaseHandler {
  // ---------------------
  // --------------GET COLLECTION--------

  Future<List<FirebaseResponseModel>?> getcollection(
      CollectionReference ref) async {
    try {
      List<FirebaseResponseModel> result = [];

      final db = await ref.get();
      result =
          db.docs.map((e) => FirebaseResponseModel.fromResponse(e)).toList();
    } catch (e) {
      print(e.toString());
    }
  }

  // ---------------------
  // -------------- GET DOCUMENT --------

  Future<FirebaseResponseModel?> getdocument(DocumentReference reff) async {
    try {
      FirebaseResponseModel result;
      final db = await reff.get();
      result = FirebaseResponseModel.fromResponse(db);
    } catch (e) {
      print(e.toString());
    }
  }

  // ---------------------
  // -------------- GET QUERY --------

  Future<List<FirebaseResponseModel>?> getquery(Query reff) async {
    List<FirebaseResponseModel> result = [];
    try {
      final db = await reff.get();
      result =
          db.docs.map((e) => FirebaseResponseModel.fromResponse(e)).toList();
    } catch (e) {}
  }

// ------------------------------
// -----------------POST DATA-----------
// ------------------------------

  Future<Firebasehandlermodel?> postData(
      response type, Map<String, dynamic> data, dynamic path) async {
    try {
      if (path is DocumentReference) {
        if (type == response.SET) {
          await path.set(data);
        } else {
          await path.update(data);
        }
      } else if (path is CollectionReference) {
        final response = await path.add(data);
        return Firebasehandlermodel(data, response.id);
      } else {
        print("-----");
      }
    } catch (e) {
      rethrow;
    }
  }
}
