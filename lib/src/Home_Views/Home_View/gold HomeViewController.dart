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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goldapp/src/Home_Views/Home_View/Home_ViewWidgets/fetchdata-controller.dart';

import '../../common_widgets/MyButton.dart';
import '../../common_widgets/reusable_simpletext.dart';




class GoldShopController extends GetxController {
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();
  TextEditingController n3 = TextEditingController();
  TextEditingController n4 = TextEditingController();
  TextEditingController n5 = TextEditingController();
  HomeFetchDataController controller=Get.put(HomeFetchDataController());

  //double
  var total = 0.0.obs;
  var userId=''.obs;

  void onfuction() {


    if(
    // n2.text==null
    //     && n3.text==null&&
    //     n3.text==null &&n4.text==null  &&n5.text==null
    n2.text==''
        && n3.text==''
        &&n4.text==''  &&n5.text==''
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


          ]
      );
    }



    //refresh();

  }
  void nullCheck() {
    // if (n1.text == '') {
    //   n1.text = '0';
    // }
    if (n2.text == '') {
      n2.text = '0';
    }
    if (n3.text == '') {
      n3.text = '0';
    }
    if (n4.text == '') {
      n4.text = '0';
    }
    if (n5.text == '') {
      n5.text = '0';
    }

  }
  void goldCalculation(){

    //first we find Rs of 1 gram
    double Rspergram = double.parse(n1.text) / 12;
    double goldgram = Rspergram * double.parse(n3.text);
    //total=total + goldgram;
    double RsperRati = double.parse(n1.text) / 96;
    double goldRati = RsperRati * double.parse(n4.text);
    //total=total + goldRati;
    double points = double.parse(n4.text) / 12;
    double goldpoints = points * double.parse(n5.text);
    double tolaPrice=double.parse(n1.text) * double.parse(n2.text);

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

String docid=DateTime.now().millisecondsSinceEpoch.toString();
      await FirebaseFirestore.instance.collection(controller.userId.value).doc(docid).set(
          {
            'goldgramQuantity' : n3.text,
            'goldRatiQuantity' : n4.text,
            'goldpointQuantity' : n5.text,
            'tolaQuantity':n2.text,
            'totalPrice':total.value,
            'tolaPrice':n1.text,
            'userid':controller.userId.value,
            'doc':docid
          }

      );
    }
    catch(error)
    {
      print('Error:$error');
    }


  }
  void refresh(){

    //Future.delayed(Duration(seconds: 3), () {
    // setState((){
    n1.clear();
    n2.clear();
    n3.clear();
    n4.clear();
    n5.clear();
    //});

    // });
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