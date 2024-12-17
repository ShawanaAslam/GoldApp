
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../../Home_View/home_View/gold-HomeView.dart';
// import '../onBording_View/onBoarding_View.dart';
//
// class SplashController extends GetxController {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(
//         Duration(
//           seconds: 5,
//         ), () {
//       //page routing----
//      // Get.to(() => OnBoardingView());
//       isUserLogin();
//     });
//   }
//
//   // one time login credentials
//   isUserLogin(BuildContext context) {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       //user did not login--> selection screen
//       Navigator.push(
//           context, CupertinoPageRoute(builder: (context) => OnBoardingView()));
//     } else {
//       // already login==> goldshop
//       Navigator.push(
//           context, CupertinoPageRoute(builder: (context) => GoldShop()));
//     }
//   }
//
// }
