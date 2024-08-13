import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

enum Authdata { LOGIN, SIGNUP }

abstract class Api {
  Future<dynamic> authencation(Authdata type, {Map<String, dynamic> json});
    Future<dynamic> get(path);
  Future<dynamic> post(path, Map<String, dynamic> data);

}

class userfunction extends Api {
  final _auth = FirebaseAuth.instance;
  @override
  Future authencation(Authdata type, {Map<String, dynamic>? json}) async {
    final email = json!["email"];
    final password = json["password"];
    try {
      if (type == Authdata.SIGNUP) {
        return await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } else {
        return await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (e) {
      rethrow;
    }
  }
  
   @override
  Future get(path) async {
    try {
      if (path is CollectionReference) {
        return await path.get();
      } else if (path is DocumentReference) {
        return await path.get();
      } else if (path is String) {
        return await http.get(Uri.parse(path));
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post(path, Map<String, dynamic> data) async {
    try {
      if (path is CollectionReference) {
        return await path.add(data);
      } else if (path is DocumentReference) {
        return await path.set(data);
      } else if (path is String) {
        return await http.post(Uri.parse(data["uri"]), body: data);
      }
    } catch (e) {
      rethrow;
    }
  }

}
