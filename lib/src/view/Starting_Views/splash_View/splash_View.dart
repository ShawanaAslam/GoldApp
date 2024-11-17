import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/common_widgets/reusable_text.dart';

import 'package:goldapp/src/view/Home_Views/gold-HomeView.dart';

import 'package:get/get_core/src/get_main.dart';

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
          seconds: 1,
        ), () {
          //page routing----
      Get.to(() => SelectionView());
    });
  }
  // one time login credentials

  // already login==> goldshop

  //user did not login--> selection screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:


          Stack(children: [
             Column(
              children: [
                Container(
                        height: 400,//double.infinity,
                        //width: double.infinity,
                        decoration:BoxDecoration(
                image:DecorationImage(
                  image: AssetImage('assets/goldring.jpeg'),
                 // Cover the entire screen
                ),
                        ),

                      ),

                 Padding(
                   padding: const EdgeInsets.only(bottom: 100),
                   child: Text( 'Gold App',style:GoogleFonts.roboto(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w800)),
                 ),



            // Stack(children: [
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
            //     ])

            ]),
            ]
          )
    );
  }
}
