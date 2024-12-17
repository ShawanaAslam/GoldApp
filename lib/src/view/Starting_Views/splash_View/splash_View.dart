


import 'package:flutter/cupertino.dart';

import '../../../Constants/images.dart';
import '../../../utills/linker.dart';

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
            Image.asset(
            Images.Logo,
             // width: 200,
              height: 200,
            ),

            SizedBox(height: 20),
           AppLoading()



          ],
        ),
      ),
    );
    // );
  }
}
