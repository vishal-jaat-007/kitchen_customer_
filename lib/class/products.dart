import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tiffin_service_customer/class/firebase.dart';

class product extends ChangeNotifier {
  final firbasehandler = FirebaseResponseHandler();
  final _firestore = FirebaseFirestore.instance;
  List<dynamic> _order = [];
  List<dynamic> get orderdata => _order;

  Future<dynamic> orderfun(Map<String, dynamic> data) async {
    final db =
        firbasehandler.postData(_firestore.collection("MyProducts"), data);
    _order.add(db);
    notifyListeners();
  }
}
