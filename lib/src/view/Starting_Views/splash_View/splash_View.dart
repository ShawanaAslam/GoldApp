import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:goldapp/src/view/Home_Views/home_view.dart';

import 'package:get/get_core/src/get_main.dart';



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
          seconds: 500,
        ), () {
          //page routing----
      Get.to(() => GoldShop());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

            Container(
              height:  double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                      AssetImage('goldring.jpeg')),
            ),),
            // SizedBox(
            //   height: 20,
            // ),
            // CircularProgressIndicator()



    );
  }
}
