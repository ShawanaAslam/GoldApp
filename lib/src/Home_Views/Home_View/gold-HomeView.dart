import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/Home_Views/AboutDevelopers_View/aboutDeveloper_View.dart';
import 'package:goldapp/src/Home_Views/Home_View/Home_ViewWidgets/fetchdata-controller.dart';
import 'package:goldapp/src/view/auth_View/signUp_View/signUp_View.dart';

import '../../common_widgets/MyButton.dart';
import '../../common_widgets/reusable_mytxtformcon.dart';
import '../../common_widgets/reusable_text.dart';
import '../AboutApp_View/aboutApp_View.dart';
import '../History_View/history_View.dart';
import 'Home_ViewWidgets/validatorTextForm.dart';
import 'gold HomeViewController.dart';

class GoldShop extends StatefulWidget {
  const GoldShop({super.key});

  @override
  State<GoldShop> createState() => _GoldShopState();
}

class _GoldShopState extends State<GoldShop> {
  // late String userId;
  // late String userEmail;
  // // best approach: late
  // String userName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //FetchuserData();
  }
  // FetchuserData() async {
  //   User? user = await FirebaseAuth.instance.currentUser;
  //   if(user!=null)// false
  //     {
  //       userEmail = user!.email ?? '';
  //       userId = user.uid ?? '';
  //       if (userEmail != null) {
  //         final userdocs = await FirebaseFirestore.instance
  //             .collection('user Data')
  //             .where('userEmail', isEqualTo: userEmail)
  //             .get();
  //         if (userdocs.docs.isNotEmpty) {
  //           setState(() {
  //             userName = userdocs.docs.first['userName'];
  //           });
  //         }
  //       }
  //     }
  //   else
  //     {
  //       userEmail='gold shop name';
  //       userName='please login';
  //       userId='';
  //       setState(() {
  //
  //       });
  //     }
  //
  // }

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    GoldShopController obj = Get.put(GoldShopController());
    HomeFetchDataController ref = Get.put(HomeFetchDataController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // navigate to history screen
            },
            icon: Icon(
              Icons.history_toggle_off,
              size: 30,
            ),
          )
        ],
        backgroundColor: Colors.amber,
        title: MyText(
          txt: 'Gold App',
          font: 25,
        ),
        centerTitle: true,
      ),
      // logout button:
      // logedin user

      // login button:
      // did not logedin
      drawer: Drawer(
        child: Container(
            color: Colors.black,
            child: Obx(
              () => ListView(
                children: [

                  UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.amber),
                      currentAccountPicture:
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Image.asset('assets/gabon.png'),
                      ),
                      accountName: Text(
                        'User Name : ${ref.userName}',
                        style: TextStyle(color: Colors.black),
                      ),
                      accountEmail: Text('User Email : ${ref.userEmail}',
                          style: TextStyle(color: Colors.black))),
                  ListTile(
                    onTap: () async {
                      Navigator.pop(context,
                          CupertinoPageRoute(builder: (context) => GoldShop()));
                    },
                    leading: Icon(Icons.home, color: Colors.amber),
                    title: Text('Home', style: TextStyle(color: Colors.amber)),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => HistoryView()));
                    },
                    leading:
                        Icon(Icons.history_toggle_off, color: Colors.amber),
                    title:
                        Text('History', style: TextStyle(color: Colors.amber)),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => AboutAppView()));
                    },
                     leading:ImageIcon(AssetImage('assets/ib.png'),color: Colors.amber,) ,
                    title: Text('About App',
                        style: TextStyle(color: Colors.amber)),
                  ),
                  ListTile(
                    onTap: () async {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Aboutdeveloper()));
                    },
                    //leading: Icon(Icons.login),
                    title: Text('About Developors',
                        style: TextStyle(color: Colors.amber)),
                  ),
                  //
                  ref.userId != ''
                      ? ListTile(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => SignupView()));
                          },
                          leading:
                              Icon(Icons.login_outlined, color: Colors.amber),
                          title: Text('logOut',
                              style: TextStyle(color: Colors.amber)),
                        )
                      : ListTile(
                          onTap: () async {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => SignupView()));
                          },
                          leading: Icon(Icons.login, color: Colors.amber),
                          title: Text('Login Screen',
                              style: TextStyle(color: Colors.amber)),
                        ),
                ],
              ),
            )),
        // flow chart
        // flow diagram
        // sketching of an application
        // in drawer header
        // picture
        // user name
        // user email

        //--------> flow chart---
        //1st: home
        // 2nd history screen
        // 3rd about app screen
        // 4th about developers screen---> developer intro , image, contacts: whatsapp , email
        // 5rd signout
        // 6th: login
      ),
      body: SingleChildScrollView(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Form(
                key: key,
                child: MyTextFormConVali(
                  controller: obj.n1,
                  hinttxt: "Enter gold Price",
                  lbltxt: "Gold Price",
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            MyText(
              txt: 'Enter Gold Quantity',
              decoration: TextDecoration.underline,
              decclr: Colors.amber,
              txtclr: Colors.amber,
              font: 18,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextFormCon(
                      hinttxt: "Enter Tola",
                      controller: obj.n2,
                      lbltxt: "Tola"),
                  SizedBox(
                    width: 50,
                  ),
                  MyTextFormCon(
                      hinttxt: "Enter Grams",
                      controller: obj.n3,
                      lbltxt: "Grams")
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextFormCon(
                      hinttxt: "Enter Rati",
                      controller: obj.n4,
                      lbltxt: "Rati"),
                  SizedBox(
                    width: 50,
                  ),
                  MyTextFormCon(
                      hinttxt: "Enter Points",
                      controller: obj.n5,
                      lbltxt: "Points"),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            MyButton(
                ontap: () {
                  if (key.currentState!.validate()) // true --- false
                  //(_formKey.currentState!.validate())
                  {
                    obj.onfuction();
                  }
                },
                txt: 'Enter',
                w: 180,
                h: 40,
                bacclr: Colors.black,
                clr: Colors.amber,
                font: 20,
                fntwt: FontWeight.w800),
          ],
        ),
      ),
    );
  }
}
