import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:goldapp/src/view/Home_View/History_View/History_Widgets/txt_Widget.dart';
import 'package:goldapp/src/view/Home_View/home_View/gold-HomeView.dart';
import 'package:goldapp/src/utills/Loading_Effect/app_Loading.dart';
import 'package:goldapp/src/view/Starting_Views/onBording_View/onBoarding_View.dart';

import '../../../Constants/images.dart';
import '../../../common_widgets/reusable_text.dart';
import '../../selection_View/selection_View.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(
          seconds: 5,
        ), () {
      //page routing----
     // Get.to(() => OnBoardingView());
      isUserLogin();
    });
  }

  // one time login credentials
  isUserLogin() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      //user did not login--> selection screen
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => OnBoardingView()));
    } else {
      // already login==> goldshop
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => GoldShop()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MyText(txt: "G",font: 150,txtclr: Colors.amber,),
            SizedBox(height: 20,),
            MyText(txt: "Gold App",font: 20,txtclr: Colors.amber,),
            // Image.asset(
            // Images.splash,
            //   width: 300,
            //   height: 250,
            // ),
            SizedBox(height: 20),


           AppLoading()



          ],
        ),
      ),
    );
    // );
  }
}
