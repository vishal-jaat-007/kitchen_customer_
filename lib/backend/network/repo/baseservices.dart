import 'package:tiffin_service_customer/view_model/model/auth/UserModel.dart';

abstract class Authentication {
  Future<Usermodel> login({required String email, required String password});
  Future<Usermodel> signup({required Usermodel user, required String password});
}


