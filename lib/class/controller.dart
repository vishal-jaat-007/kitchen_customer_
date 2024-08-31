import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:tiffin_service_customer/class/firebase.dart';

class usercontroller extends ChangeNotifier {
  final _Firebasehandler = FirebaseResponseHandler();
  final _firebase = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  dynamic _user;
  dynamic get _userdata => _user;

  Future<dynamic> Signup(
      Map<String, dynamic> data, String email, String password) async {
    try {
      final db = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
          _Firebasehandler.postData(_firebase.collection("user"), data);
      return db;
    } catch (e) {
      print(e.toString());
    }
  }
}
