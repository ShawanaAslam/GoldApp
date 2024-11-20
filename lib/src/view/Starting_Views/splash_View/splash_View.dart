import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:goldapp/src/view/Home_Views/gold-HomeView.dart';

import 'package:get/get_core/src/get_main.dart';
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
          seconds: 3,
        ), () {
      //page routing----
      Get.to(() => OnBoardingView());
    });
  }
  // one time login credentials
isUserLogin()
{
  User? user=FirebaseAuth.instance.currentUser;
  if(user == null)
    {
      //user did not login--> selection screen
      Navigator.push(context,CupertinoPageRoute(builder:(context)=>SelectionView()));
    }
  else
    {
      // already login==> goldshop
      Navigator.push(context,CupertinoPageRoute(builder:(context)=>GoldShop()));
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
              'assets/bars.png',
              width: 250,
              height: 150,
            ),
            SizedBox(height: 80),
            // Below Image Text
            Text(
              ' Gold App',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color:
                    Colors.amber,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(color: Colors.amber,)
          ],
        ),
      ),


    );
  }
}
