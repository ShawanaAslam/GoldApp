import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/common_widgets/reusable_text.dart';

import 'package:goldapp/src/view/Home_Views/gold-HomeView.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:goldapp/src/view/Starting_Views/onBording_View/onBoarding_View.dart';

import 'package:google_fonts/google_fonts.dart';

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

  // already login==> goldshop

  //user did not login--> selection screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/goldring.jpeg', // Replace with your logo path
                  width: 250,
                  height: 150,
                ),
                const SizedBox(height: 20),
                // Below Image Text
                Text(
                  'Welcome to Gold App', // Replace with your text
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color:
                        Colors.black, // Text color will be visible over black
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Black Overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0), // Adjust opacity as needed
                  Colors.black, // Adjust as needed
                ],
              ),
            ),
          ),

          // Container(
          //   color: Colors.black.withOpacity(0.5), // Full screen black overlay
          // ),
        ],
      ),

      // Stack(children: [
      //    Column(
      //     children: [
      //       Container(
      //               height: 400,//double.infinity,
      //               //width: double.infinity,
      //               decoration:BoxDecoration(
      //       image:DecorationImage(
      //         image: AssetImage('assets/goldring.jpeg'),
      //        // Cover the entire screen
      //       ),
      //               ),
      //
      //             ),
      //
      //        Padding(
      //          padding: const EdgeInsets.only(bottom: 100),
      //          child: Text( 'Gold App',style:GoogleFonts.roboto(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w800)),
      //        ),
      //
      //
      //
      //   // Stack(children: [
      //         Container(
      //           width: double.infinity,
      //           height: double.infinity,
      //           decoration: BoxDecoration(
      //             gradient: LinearGradient(
      //               begin: Alignment.topCenter,
      //               end: Alignment.bottomCenter,
      //               colors: [
      //                 Colors.black.withOpacity(0), // Adjust opacity as needed
      //                 Colors.black, // Adjust as needed
      //               ],
      //             ),
      //           ),
      //         ),
      //   //     ])
      //
      //   ]),
      //   ]
      //)
    );
  }
}
