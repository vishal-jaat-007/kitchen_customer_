import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiffin_service_customer/view_model/model/firebase/firebaseResponsemode.dart';

enum RequestType { ADD, SET, UPDATE }

class FirebaseResponseHandler {
  final _firestore = FirebaseFirestore.instance;

  // -----------
// ------------------- GET DATA  -------------------
// ------------------------

  Future<dynamic> getDataFromFirebase(dynamic path) async {
    // ignore: unused_local_variable
    dynamic response;
    try {
      if (path is CollectionReference) {
        response = await _getDataFromCollection(path);
      } else if (path is DocumentReference) {        
        response = await _getDataFromDocument(path);
      } else {
        response = await _getDataFromQuery(path as Query);
      }
    } catch (e) {
      rethrow;
    }
  }

  // ------- 
// --------------------
// ----------

  Future<List<FirebaseResponseModel>> _getDataFromCollection(
      CollectionReference reff) async {
    List<FirebaseResponseModel> result = [];
    try {
      final snapshot = await reff.get();
      result = snapshot.docs
          .map((e) => FirebaseResponseModel.fromResponse(e))
          .toList();
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<FirebaseResponseModel?> _getDataFromDocument(
      DocumentReference reff) async {
    FirebaseResponseModel? result;
    try {
      final snapshot = await reff.get();    
      result = FirebaseResponseModel.fromResponse(snapshot);
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<List<FirebaseResponseModel>> _getDataFromQuery(Query reff) async {
    List<FirebaseResponseModel> result = [];
    try {
      final snapshot = await reff.get();
      result = snapshot.docs
          .map((e) => FirebaseResponseModel.fromResponse(e))
          .toList();
    } catch (e) {
      rethrow;
    }

    return result;
  }

// -----------
// ------------------- POST DATA  -------------------
// ------------------------
  Future<FirebaseResponseModel?> postData(
      dynamic path, Map<String, dynamic> data,
      [RequestType? request]) async {
    try {
      if (path is DocumentReference) {
        if (request == RequestType.SET) {
          await path.set(data);
        } else {
          await path.update(data);
        }
      } else if (path is CollectionReference) {
        final response = await path.add(data);
        return FirebaseResponseModel(data, response.id);
      } else {
        throw "Invalid Request";
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<void> deleteData(dynamic path) async {
    try {
      if (path is DocumentReference) {
        await path.delete();
      } else if (path is CollectionReference) {
        final snapshot = await path.get();
        final batch = _firestore.batch();

        for (var doc in snapshot.docs) {
          batch.delete(doc.reference);
        }

        await batch.commit();
      } else {
        throw "Invalid Request";
      }
    } catch (e) {
      rethrow;
    }
  }
}
