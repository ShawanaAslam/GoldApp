import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:goldapp/src/Home_Views/Home_View/gold-HomeView.dart';

import 'package:goldapp/src/view/Starting_Views/splash_View/splash_View.dart';
import 'package:goldapp/src/view/auth_View/signUp_View/signUp_View.dart';
import 'package:goldapp/src/view/selection_View/selection_View.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(


      // options: FirebaseOptions
      //   (
      //     apiKey: "AIzaSyBtZTIGR-wo3YwJIOuWpj_mB5P0p1StLIw",
      //     appId: "1:836795650404:web:062bf4183884eee3ac2a71",
      //     messagingSenderId: "836795650404",
      //     projectId: "projectmanagement-e7efa")
   );
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
      designSize: Size(390,844),
      builder: (context,child)
        {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Gold App',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home:
              //GoldShop()
              // SignupView()
              // SelectionView()
             // SplashView() //const MyHomePage(title: 'Flutter Demo Home Page'),
              UrlScreen()
          );
        }
    );

  }
}

class UrlScreen extends StatefulWidget {
  const UrlScreen({super.key});

  @override
  State<UrlScreen> createState() => _UrlScreenState();
}

class _UrlScreenState extends State<UrlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
       InkWell(
         onTap: ()async{
           // Link create for whastapp
           final whatsappUrl=Uri.parse("https://wa.me/+923346985327");
           final githubUrl=Uri.parse("https://github.com/Siddique722");
           final liknedin=Uri.parse("www.linkedin.com/in/siddique-qureshi-22bb78233");
           await launchUrl(whatsappUrl);
         },
         child:  Text('Contact On WhatsApp'),
       )),
    );
  }
}
