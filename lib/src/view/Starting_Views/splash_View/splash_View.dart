import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:goldapp/src/Home_Views/Home_View/gold-HomeView.dart';
import 'package:goldapp/src/view/Starting_Views/onBording_View/onBoarding_View.dart';

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
      Get.to(() => OnBoardingView());
    });
  }

  // one time login credentials
  isUserLogin() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      //user did not login--> selection screen
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => SelectionView()));
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
            Image.asset(
              'assets/gabon.png',
              width: 300,
              height: 250,
            ),
            SizedBox(height: 20),
            //  Below Image Text
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'GA',
            //       textAlign: TextAlign.center,
            //       style: const TextStyle(
            //         color: Colors.amber,
            //         fontSize: 108,
            //         fontWeight: FontWeight.bold,
            //       ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top:30),
            //   child: Text(
            //     ' A',
            //     textAlign: TextAlign.center,
            //     style: const TextStyle(
            //       color:
            //       Colors.amber,
            //       fontSize: 50,
            //       fontWeight: FontWeight.w800,
            //     ),
            //   ),
            // ),
            CircularProgressIndicator(
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
    // );
  }
}
