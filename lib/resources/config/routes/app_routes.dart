import 'package:get/get.dart';
import 'package:tiffin_service_customer/views/pages/auth/signup/Signup.dart';

import '../../../views/pages/pages.dart';

class AppPages {
  static const intialroute = Routes.onboarding;
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => Onboardingscreen(),
    ),
    GetPage(name: Routes.Loginview, page: () => Loginview()),
    GetPage(name: Routes.Signup, page: () => Signup()),
    GetPage(name: Routes.Otpverfication, page: () => Otpverfication()),
    GetPage(name: Routes.Myprofileview, page: () => Myprofileview()),
    GetPage(
        name: Routes.CompleteYourProfile, page: () => CompleteYourProfile()),
    GetPage(name: Routes.bottomnavigationbar, page: () => MyBottomNavi()),
    GetPage(name: Routes.Billingscreen, page: () => Billingscreen()),
    GetPage(name: Routes.Profileeditscreen, page: () => Profileedit()),
    GetPage(name: Routes.Applicationsetting, page: () => Applicationsetting()),
    GetPage(name: Routes.Changetheme, page: () => Changetheme()),
    GetPage(name: Routes.Changelanguage, page: () => Changelanguage()),
    GetPage(name: Routes.changenotification, page: () => Changenotification()),
    GetPage(
        name: Routes.onetimeorder,
        page: () => OneTimeOrderscreen(
              category: Get.arguments,
            )),
    GetPage(
        name: Routes.SubscriptionOrderscreen,
        page: () => SubscriptionOrderscreen()),
    GetPage(name: Routes.Searchscreen, page: () => SearchView()),
    GetPage(name: Routes.notification, page: () => NotificationView()),
    GetPage(name: Routes.Subscriptionview, page: () => Subscriptionview()),
    GetPage(name: Routes.OrdersScreen, page: () => OrdersScreen()),
    GetPage(name: Routes.Subscriptionview, page: () => Subscriptionview()),
    GetPage(name: Routes.Manageaddress, page: () => Manageaddress()),
    GetPage(name: Routes.Mealcancellationn, page: () => Mealcancellationn()),
    GetPage(name: Routes.Privacypolicy, page: () => Privacypolicy()),
    GetPage(name: Routes.Contactandsupport, page: () => Contactandsupport()),
    GetPage(
        name: Routes.Subscriptiondetails,
        page: () => Subscriptiondetails(data: Get.arguments)),
    GetPage(
        name: Routes.SubscriptionCancellation,
        page: () => SubscriptionCancellation(data: Get.arguments)),
    GetPage(name: Routes.AddAdrees, page: () => AddNewAddress()),
    GetPage(name: Routes.Chatscreen, page: () => view_chat()),
    GetPage(name: Routes.appinfo, page: () => AppinfoScreen()),
    GetPage(name: Routes.deletemyaccount, page: () => Deletemyaccount()),
    GetPage(name: Routes.deletenow, page: () => Deleteaccountnow()),
    GetPage(name: Routes.ChatandcallScreen, page: () => ChatandcallScreen()),
  ];
}

class Routes {
  static const home = '/';
  static const onboarding = '/onboarding';
  static const Loginview = '/Loginview';
  static const Signup = '/Signup';
  static const Otpverfication = '/Otpverfication';
  static const Myprofileview = '/Myprofileview';
  static const CompleteYourProfile = '/CompleteYourProfile';
  static const bottomnavigationbar = '/bottomnavigationbar';
  static const Billingscreen = '/Billingscreen';
  static const onetimeorder = '/onetimeorder';
  static const SubscriptionOrderscreen = '/SubscriptionOrderscreen';
  static const Profileeditscreen = '/Profileeditscreen';
  static const Applicationsetting = '/Applicationsetting';
  static const Changetheme = '/Changetheme';
  static const Changelanguage = '/Changelanguage';
  static const changenotification = '/changenotification';
  static const Searchscreen = '/Searchscreen';
  static const notification = '/notification';
  static const Subscriptionview = '/Subscriptionview';
  static const SubscriptionCancellation = '/SubscriptionCancellation';
  static const OrdersScreen = '/OrdersScreen';
  static const Manageaddress = '/Manageaddress';
  static const Mealcancellationn = '/Mealcancellationn';
  static const Privacypolicy = '/Privacypolicy';
  static const Contactandsupport = '/Contactandsupport';
  static const Subscriptiondetails = '/ScaleUpdateDetails';
  static const AddAdrees = '/AddAdrees';
  static const Chatscreen = '/Chatscreen';
  static const appinfo = '/appinfo';
  static const deletemyaccount = '/deletemyaccount';
  static const deletenow = '/deletenow';
  static const ChatandcallScreen = '/ChatandcallScreen';
  static const Weeklymenuview = '/Weeklymenuview';
}
