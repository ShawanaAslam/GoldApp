//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:goldapp/src/Home_Views/Home_View/Home_ViewWidgets/fetchdata-controller.dart';
//
// import '../../common_widgets/MyButton.dart';
// import '../../common_widgets/reusable_simpletext.dart';
//
//
//
//
// class GoldShopController extends GetxController {
//   TextEditingController n1 = TextEditingController();
//   TextEditingController n2 = TextEditingController();
//   TextEditingController n3 = TextEditingController();
//   TextEditingController n4 = TextEditingController();
//   TextEditingController n5 = TextEditingController();
//   HomeFetchDataController controller=Get.put(HomeFetchDataController());
//
//   //double
//   var total = 0.0.obs;
//
//   void onfuction() {
//
//
//   if(
//   // n2.text==null
//   //     && n3.text==null&&
//   //     n3.text==null &&n4.text==null  &&n5.text==null
//   n2.text==''
//       && n3.text==''
//        &&n4.text==''  &&n5.text==''
//   )
//     {
//       Get.defaultDialog(
//         backgroundColor: Colors.amber,
//         title: 'Warning!',
//         titleStyle: TextStyle(color: Colors.black),
//         content: SimpleText(
//           txt: 'Please enter a value in at least one field \n(Tola, Gram, Rati, or Points).',
//           font: 18,
//           fntwt: FontWeight.w800,
//         ),
//         actions: [
//           MyButton(
//             ontap: () {
//               Get.back();
//             },
//             txt: 'OK',
//             w: 70,
//             h: 40,
//             bacclr: Colors.amber,
//             clr: Colors.black,
//             font: 15,
//           ),
//         ],
//       );
//     }
//   else
//     {
//       nullCheck();
//
//       goldCalculation();
//
//
//       Get.defaultDialog(
//
//           backgroundColor: Colors.amber,
//           title: 'Total Rs :',
//           titleStyle: TextStyle(color: Colors.black),
//           content: SimpleText(txt: '$total', font: 20, fntwt: FontWeight.w800),
//           actions: [
//
//             MyButton(
//               ontap: (){
//                 refresh();
//                 Get.back();
//               },
//               txt: 'Back',
//               w: 70,
//               h: 40,
//               bacclr: Colors.amber,
//               clr: Colors.black,
//               font: 15,),
//
//
//           ]
//       );
//     }
//
//
//
//     //refresh();
//
//   }
//   void nullCheck() {
//     // if (n1.text == '') {
//     //   n1.text = '0';
//     // }
//     if (n2.text == '') {
//       n2.text = '0';
//     }
//     if (n3.text == '') {
//       n3.text = '0';
//     }
//     if (n4.text == '') {
//       n4.text = '0';
//     }
//     if (n5.text == '') {
//       n5.text = '0';
//     }
//
//   }
//   void goldCalculation(){
//
//     //first we find Rs of 1 gram
//     double Rspergram = double.parse(n1.text) / 12;
//     double goldgram = Rspergram * double.parse(n3.text);
//     //total=total + goldgram;
//     double RsperRati = double.parse(n1.text) / 96;
//     double goldRati = RsperRati * double.parse(n4.text);
//     //total=total + goldRati;
//     double points = double.parse(n4.text) / 12;
//     double goldpoints = points * double.parse(n5.text);
//     double tolaPrice=double.parse(n1.text) * double.parse(n2.text);
//
//     total.value = tolaPrice + goldgram + goldRati + goldpoints;
//     // function calling:-
//     if(controller.userId.value!='')// false
//       {
//       insertData();
//       }
//     // else
//     //   {
//     //     insertData();
//     //   }
//
//
//
//   }
// Future<void> insertData()async{
//     try
//     {
//
//
//       await FirebaseFirestore.instance.collection('Data').add(
//       {
//         'goldgramQuantity' : n3.text,
//         'goldRatiQuantity' : n4.text,
//         'goldpointQuantity' : n5.text,
//         'tolaQuantity':n2.text,
//         'totalPrice':total.value,
//         'tolaPrice':n1.text,
//         'userid':controller.userId.value
//       }
//
//       );
//     }
//     catch(error)
//   {
//     print('Error:$error');
//   }
//
//
// }
//   void refresh(){
//
//     //Future.delayed(Duration(seconds: 3), () {
//     // setState((){
//     n1.clear();
//     n2.clear();
//     n3.clear();
//     n4.clear();
//     n5.clear();
//     //});
//
//     // });
//   }
// }
//
// // }----------------------------------------------------------------------
// // import 'package:get/get.dart';
// // import 'package:flutter/material.dart'; // Import for Colors and TextStyle
// //
// // import '../controller/constants/linker/linker.dart';
// //
// // class GoldShopController extends GetxController {
// //   TextEditingController n1 = TextEditingController();
// //   TextEditingController n2 = TextEditingController();
// //   TextEditingController n3 = TextEditingController();
// //   TextEditingController n4 = TextEditingController();
// //   TextEditingController n5 = TextEditingController();
// //
// //   // Change total to RxDouble
// //   var total = 0.0.obs;
// //
// //   void onFunction() {
// //     if (n1.text == '') n1.text = '0';
// //     if (n2.text == '') n2.text = '0';
// //     if (n3.text == '') n3.text = '0';
// //     if (n4.text == '') n4.text = '0';
// //     if (n5.text == '') n5.text = '0';
// //
// //     // Calculate Rs per gram and Rs per Rati
// //     double RsPerGram = double.parse(n1.text) / 12;
// //     double goldGram = RsPerGram * double.parse(n3.text);
// //
// //     double RsPerRati = double.parse(n1.text) / 96;
// //     double goldRati = RsPerRati * double.parse(n4.text);
// //
// //     double points = double.parse(n4.text) / 12;
// //     double goldPoints = points * double.parse(n5.text);
// //
// //     // Update total with the calculated result
// //     total.value = (double.parse(n1.text) * double.parse(n2.text)) + (goldGram + goldRati + goldPoints);
// //
// //     Get.defaultDialog(
// //       backgroundColor: Colors.amber,
// //       title: 'Total Rs :',
// //       titleStyle: TextStyle(color: Colors.black),
// //       content: SimpleText(txt: '${total.value}', font: 20, fntwt: FontWeight.w800),
// //       actions: [
// //         InkWell(
// //           onTap: () {
// //             Get.back();
// //           },
// //           child: MyContainer(
// //             txt: 'Back',
// //             w: 70,
// //             h: 40,
// //             bacclr: Colors.amber,
// //             clr: Colors.black,
// //             font: 15,
// //           ),
// //         )
// //       ],
// //     );
// //
// //     Future.delayed(Duration(seconds: 3), () {
// //       n1.clear();
// //       n2.clear();
// //       n3.clear();
// //       n4.clear();
// //       n5.clear();
// //     });
// //   }
// // }




///-----------------------------
///

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:goldapp/src/view/Home_View/home_View/Billing-screen/billing-home-view.dart';
import 'package:goldapp/src/view/Home_View/home_View/home_ViewWidgets/fetchdata-controller.dart';
import 'package:goldapp/src/view/auth_View/login_View/login_View.dart';

import '../../../common_widgets/MyButton.dart';
import '../../../common_widgets/reusable_simpletext.dart';
import 'Billing_View/billing_homeView.dart';




class GoldShopController extends GetxController {
  TextEditingController goldPriceController = TextEditingController();
  TextEditingController tolaPricecontroller = TextEditingController();
  TextEditingController gramPricecontroller = TextEditingController();
  TextEditingController ratiPricecontroller = TextEditingController();
  TextEditingController pointsPricecontroller = TextEditingController();
  HomeFetchDataController controller=Get.put(HomeFetchDataController());
  var isLoading = false.obs;
  //double
  var total = 0.0.obs;
  var userId=''.obs;

  void onfuction() {


    if(
    // n2.text==null
    //     && n3.text==null&&
    //     n3.text==null &&n4.text==null  &&n5.text==null
    tolaPricecontroller.text==''
        && gramPricecontroller.text==''
        && ratiPricecontroller.text==''  && pointsPricecontroller.text==''
    )
    {
      Get.defaultDialog(
        backgroundColor: Colors.amber,
        title: 'Warning!',
        titleStyle: TextStyle(color: Colors.black),
        content: SimpleText(
          txt: 'Please enter a value in at least one field \n(Tola, Gram, Rati, or Points).',
          font: 18,
          fntwt: FontWeight.w800,
        ),
        actions: [
          MyButton(
            ontap: () {
              Get.back();
            },
            txt: 'OK',
            w: 70,
            h: 40,
            bacclr: Colors.amber,
            clr: Colors.black,
            font: 15,
          ),
        ],
      );
    }
    else
    {
      nullCheck();

      goldCalculation();


      Get.defaultDialog(

          backgroundColor: Colors.amber,
          title: 'Total Rs :',
          titleStyle: TextStyle(color: Colors.black),
          content: SimpleText(txt: '$total', font: 20, fntwt: FontWeight.w800),
          actions: [

            MyButton(
              ontap: (){
                refresh();
                Get.back();
              },
              txt: 'Back',
              w: 70,
              h: 40,
              bacclr: Colors.amber,
              clr: Colors.black,
              font: 15,),
            MyButton( txt: 'Print',
                w: 70,
                h: 40,
                bacclr: Colors.amber,
                clr: Colors.black,
                font: 15,
                ontap: (){
              Get.back();

              Get.to(()=>BillingHomeView(
                  goldPrice: goldPriceController.text,
                  tolaQuantity: tolaPricecontroller.text,
                  gramsQuantity: gramPricecontroller.text,
                  ratiQuantity: ratiPricecontroller.text,
                  pointsQuantity: pointsPricecontroller.text,
                  totalPrice: total.value
              ));
            //  refresh();
                })


          ]
      );
    }



    //refresh();

  }
  void nullCheck() {
    // if (n1.text == '') {
    //   n1.text = '0';
    // }
    if (tolaPricecontroller.text == '') {
      tolaPricecontroller.text = '0';
    }
    if (gramPricecontroller.text == '') {
      gramPricecontroller.text = '0';
    }
    if (ratiPricecontroller.text == '') {
      ratiPricecontroller.text = '0';
    }
    if (pointsPricecontroller.text == '') {
      pointsPricecontroller.text = '0';
    }

  }
  void goldCalculation(){

    //first we find Rs of 1 gram
    double Rspergram = double.parse(goldPriceController.text) / 12;
    double goldgram = Rspergram * double.parse(gramPricecontroller.text);
    //total=total + goldgram;
    double RsperRati = double.parse(goldPriceController.text) / 96;
    double goldRati = RsperRati * double.parse(ratiPricecontroller.text);
    //total=total + goldRati;
    double points = double.parse(ratiPricecontroller.text) / 100;
    double goldpoints = points * double.parse(pointsPricecontroller.text);
    double tolaPrice=double.parse(goldPriceController.text) * double.parse(tolaPricecontroller.text);

    total.value = tolaPrice + goldgram + goldRati + goldpoints;
    // function calling:-
    if(controller.userId.value!='')// false
        {
      insertData();
    }
    // else
    //   {
    //     insertData();
    //   }



  }
  Future<void> insertData()async{
    try
    {

      isLoading.value = true;
String docid=DateTime.now().millisecondsSinceEpoch.toString();
      await FirebaseFirestore.instance.collection(controller.userId.value).doc(docid).set(
          {
            'goldgramQuantity' : gramPricecontroller.text,
            'goldRatiQuantity' : ratiPricecontroller.text,
            'goldpointQuantity' : pointsPricecontroller.text,
            'tolaQuantity':tolaPricecontroller.text,
            'totalPrice':total.value,
            'tolaPrice':goldPriceController.text,
            'userid':controller.userId.value,
            'doc':docid
          }


      );
    }
    catch(error)
    {
      isLoading.value = false;
      print('Error:$error');
    }


  }
  void refresh(){

    //Future.delayed(Duration(seconds: 3), () {
    // setState((){
    goldPriceController.clear();
    tolaPricecontroller.clear();
    gramPricecontroller.clear();
    ratiPricecontroller.clear();
    pointsPricecontroller.clear();
    //});

    // });
  }
  Future<void>logout(BuildContext context)async{

    await FirebaseAuth.instance.signOut();
    Get.delete<GoldShopController>();
    Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
            builder: (context) => LoginView()));

  }
}

// }----------------------------------------------------------------------
// import 'package:get/get.dart';
// import 'package:flutter/material.dart'; // Import for Colors and TextStyle
//
// import '../controller/constants/linker/linker.dart';
//
// class GoldShopController extends GetxController {
//   TextEditingController n1 = TextEditingController();
//   TextEditingController n2 = TextEditingController();
//   TextEditingController n3 = TextEditingController();
//   TextEditingController n4 = TextEditingController();
//   TextEditingController n5 = TextEditingController();
//
//   // Change total to RxDouble
//   var total = 0.0.obs;
//
//   void onFunction() {
//     if (n1.text == '') n1.text = '0';
//     if (n2.text == '') n2.text = '0';
//     if (n3.text == '') n3.text = '0';
//     if (n4.text == '') n4.text = '0';
//     if (n5.text == '') n5.text = '0';
//
//     // Calculate Rs per gram and Rs per Rati
//     double RsPerGram = double.parse(n1.text) / 12;
//     double goldGram = RsPerGram * double.parse(n3.text);
//
//     double RsPerRati = double.parse(n1.text) / 96;
//     double goldRati = RsPerRati * double.parse(n4.text);
//
//     double points = double.parse(n4.text) / 12;
//     double goldPoints = points * double.parse(n5.text);
//
//     // Update total with the calculated result
//     total.value = (double.parse(n1.text) * double.parse(n2.text)) + (goldGram + goldRati + goldPoints);
//
//     Get.defaultDialog(
//       backgroundColor: Colors.amber,
//       title: 'Total Rs :',
//       titleStyle: TextStyle(color: Colors.black),
//       content: SimpleText(txt: '${total.value}', font: 20, fntwt: FontWeight.w800),
//       actions: [
//         InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: MyContainer(
//             txt: 'Back',
//             w: 70,
//             h: 40,
//             bacclr: Colors.amber,
//             clr: Colors.black,
//             font: 15,
//           ),
//         )
//       ],
//     );
//
//     Future.delayed(Duration(seconds: 3), () {
//       n1.clear();
//       n2.clear();
//       n3.clear();
//       n4.clear();
//       n5.clear();
//     });
//   }
// }