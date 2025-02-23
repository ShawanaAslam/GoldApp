
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:goldapp/src/view/Starting_Views/splash_View/splash_View.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

      //  options: FirebaseOptions
      //  (
      //   apiKey: "AIzaSyBtZTIGR-wo3YwJIOuWpj_mB5P0p1StLIw",
      // appId: "1:836795650404:web:062bf4183884eee3ac2a71",
      //messagingSenderId: "836795650404",
      //projectId: "projectmanagement-e7efa")
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(390, 844),
        builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Gold App',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home:
                //  ShopInformationview()
                  // HistoryView(history: [],)
                  // OnBoardingView()
                  //  GoldShop()
                  // SignupView()
                  // SelectionView()
                 SplashView() //const MyHomePage(title: 'Flutter Demo Home Page'),
              // BillingHomeView()
              // BillingHomeView(
              //     goldPrice: '0',
              //     tolaQuantity: '90',
              //     gramsQuantity: '90',
              //     ratiQuantity: '90',
              //     pointsQuantity: '90',
              //     totalPrice: 5)
              // UrlScreen()
              );
        });
  }
}
