
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/backend/network/repo/auth_repositry.dart';
import 'package:tiffin_service_customer/backend/network/repo/sharedPerf.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/view_model/controllers/auth/user_controller.dart';
import 'package:tiffin_service_customer/view_model/model/auth/UserModel.dart';

class AuthDataHandler {
  final _repo = AuthRepositry();
  final UserController _userController = Get.find<UserController>();

  signup({required Usermodel user, required String password}) async {
    try {
      final usersnapshot = await _repo.signup(user: user, password: password);
      _userController.setUser(usersnapshot);

      await SpData.setprafdata(SpData.userid, usersnapshot.uid);
      Get.toNamed(Routes.CompleteYourProfile, arguments: usersnapshot.tojson());
    } catch (e) {
      rethrow;
    }
  }

  login({required String email, required String password}) async {
    try {
      final usersnapshot = await _repo.login(email: email, password: password);
      _userController.setUser(usersnapshot);
      await SpData.setprafdata(SpData.userid, usersnapshot.uid);
      Get.toNamed(
        Routes.bottomnavigationbar,
      );
    } catch (e) {
      rethrow;
    }
  }

  logout() {
    SpData.removeprafdata(SpData.userid);
    FirebaseAuth.instance.signOut();
    _userController.setUser(Usermodel()); // Clear user data in the controller
  }

  completeProfile({required user}) {}
}
