import 'package:flutter/cupertino.dart';

import '../../../Constants/images.dart';
import '../../../common_widgets/reusable_mytxtformcon.dart';
import '../../../utills/linker.dart';
import '../AboutApp_View/aboutApp_View.dart';
import '../History_View/history_View.dart';
import 'gold HomeViewController.dart';
import 'home_ViewWidgets/validatorTextForm.dart';

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
  ShopInfoController shopInfoController = Get.put(ShopInfoController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.fetchUserData();
    shopInfoController.fetchShopInfo();
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
  HomeFetchDataController ref = Get.put(HomeFetchDataController());

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    GoldShopController obj = Get.put(GoldShopController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Obx(() {
            return ref.userId.value != ''
                ? IconButton(
                    onPressed: () {
                      // navigate to history screen
                      Get.to(() => HistoryView());
                    },
                    icon: Icon(
                      Icons.history_toggle_off,
                      size: 30,
                    ),
                  )
                : Container();
          })
        ],
        backgroundColor: Colors.amber,
        title: MyText(
          txt: 'Gold App',
          font: 25,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
            color: Colors.black,
            child: Obx(
              () => ListView(
                children: [
                  UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.amber),
                      currentAccountPicture: CircleAvatar(
                        //  radius: 20,
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage(Images.Logo),
                      ),
                      accountName: Text(
                        'Shop Name : ${shopInfoController.shopname}',
                        //'Shop Name : ${ref.userName}',
                        style: TextStyle(color: Colors.black),
                      ),
                      accountEmail: Text('User Email : ${ref.userEmail}',
                          style: TextStyle(color: Colors.black))),

                  ListTileWidget(
                      ontap: () {
                        Get.back();
                      },
                      txt: 'Gold App',
                      icon: Icons.home),

                  Obx(() {
                    return ref.userId.value != ''
                        ? ListTileWidget(
                            ontap: () {
                              Get.back();
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => HistoryView()));
                            },
                            txt: 'History',
                            icon: Icons.history_toggle_off)
                        : Container();
                  }),
                  ListTile(
                    onTap: () {
                      Get.back();
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => AboutAppView()));
                    },
                    leading: ImageIcon(
                      AssetImage(Images.aboutApp),
                      color: Colors.amber,
                    ),
                    title: Text('About App',
                        style: TextStyle(color: Colors.amber)),
                  ),
                  ListTile(
                    onTap: () {
                      Get.back();
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => AboutDeveloper()));
                    },
                    leading: ImageIcon(
                      AssetImage(Images.aboutDeveloper),
                      color: Colors.amber,
                    ),
                    title: Text('About Developor',
                        style: TextStyle(color: Colors.amber)),
                  ),

                  // logout button:
                  // logedin user

                  // login button:
                  // did not logedin
                  ref.userId != ''
                      ? ListTileWidget(
                          ontap: () {
                            // await FirebaseAuth.instance.signOut();
                            obj.logout(context);
                          },
                          txt: 'logOut',
                          icon: Icons.login_outlined,
                        )
                      : ListTileWidget(
                          ontap: () {
                            Get.back();
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => LoginView()));
                          },
                          txt: 'Login Screen',
                          icon: Icons.login,
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
           //       Keyboardtype: TextInputType.number,
                  controller: obj.goldPriceController,
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
                      controller: obj.tolaPricecontroller,
                      lbltxt: "Tola"),
                  SizedBox(
                    width: 50,
                  ),
                  MyTextFormCon(
                      hinttxt: "Enter Grams",
                      controller: obj.gramPricecontroller,
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
                      controller: obj.ratiPricecontroller,
                      lbltxt: "Rati"),
                  SizedBox(
                    width: 50,
                  ),
                  MyTextFormCon(
                      hinttxt: "Enter Points",
                      controller: obj.pointsPricecontroller,
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
                txt: 'Calculate',
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
