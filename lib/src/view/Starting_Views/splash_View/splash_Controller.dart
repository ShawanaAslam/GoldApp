//
//
// import 'package:flutter/cupertino.dart';
//
// import '../../../utills/linker.dart';
//
// class SplashController extends GetxController {
//
//  // Future<void>
//   isUserLogin() {
//     // one time login credentials
//     isUserLogin (BuildContext context) async{
//       User? user = await FirebaseAuth.instance.currentUser;
//       if (user == null) {
//         //user did not login--> selection screen
//         Navigator.pushReplacement(
//             context,
//             CupertinoPageRoute(builder: (context) => OnBoardingView()));
//       } else {
//         // already login==> goldshop
//         Navigator.pushReplacement(
//             context, CupertinoPageRoute(builder: (context) => GoldShop()));
//       }
//     }
//   }
//
// }
