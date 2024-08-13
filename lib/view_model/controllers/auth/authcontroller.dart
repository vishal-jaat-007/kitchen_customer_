import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/view_model/controllers/auth/function.dart';
import 'package:tiffin_service_customer/view_model/controllers/auth/sharedpref.dart';
import 'package:tiffin_service_customer/view_model/model/user/userdata.dart';

class Usercontroller extends ChangeNotifier {
  bool _loading = false;
  dynamic get loading => _loading;
  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // --------------------------------------
  final _response = userfunction();
  final _firestore = FirebaseFirestore.instance;
  dynamic _user;
  Usermodel get userdata => _user;
  setuserdata(Usermodel model) {
    _user = model;
    notifyListeners();
  }

  //  SIGNUP
  final getdata = userfunction();
  Future signUp(Map<String, dynamic> data, BuildContext context) async {
    final Usermodel userdata = Usermodel.fromojson(data["user"]);
    try {
      final usercredential = await _response.authencation(Authdata.SIGNUP,
              json: {"email": userdata.email, "password": data["password"]})
          as UserCredential;
      final String userid = usercredential.user!.uid;
      if (userid.isNotEmpty) {
        await getdata.post(_firestore.collection("user").doc(userid),
            userdata.copywith(id: userid).tojson());

        _user = userdata.copywith(id: userid);
        Get.toNamed(Routes.home);
      }
    } catch (e) {
      print("-----------------------");
      print(e.toString());
      print("-----------------------");
    } finally {
      notifyListeners();
    }
  }

  Future Login(Map<String, dynamic> data, BuildContext context) async {
    final Usermodel userdata = Usermodel.fromojson(data["user"]);
    setloading(true);
    try {
      final usercredential = await _response.authencation(Authdata.LOGIN,
              json: {"email": userdata.email, "password": data["password"]})
          as UserCredential;
      final String userid = usercredential.user!.uid;
      if (userid.isNotEmpty) {
        await getdata.get(_firestore.collection("user").doc(userid));
        _user = userdata.copywith(id: userid);
        Sharedpref.setpref(Sharedpref.useridkey, userid);
        Get.toNamed(Routes.home);
      }
    } catch (e) {
      print("-------------");
      print(e.toString());
      print("-------------");
    } finally {
      notifyListeners();
      setloading(false);
    }
  }
}
