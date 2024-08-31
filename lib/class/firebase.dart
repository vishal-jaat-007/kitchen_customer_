import 'package:cloud_firestore/cloud_firestore.dart';

import '../view_model/model/models.dart';

enum RequestType { ADD, SET, UPDATE }

class FirebaseResponseHandler { 
  final _firestore = FirebaseFirestore.instance;

  Future<dynamic> getDataFromFirebase(dynamic path) async {
    dynamic response;
    try {
      if (path is CollectionReference) {
        response = await (path);
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



  // ignore: unused_element
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
}
