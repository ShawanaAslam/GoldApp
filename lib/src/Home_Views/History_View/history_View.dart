// //import 'dart:ffi';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:goldapp/src/Home_Views/History_View/History_widgets/txt_Widget.dart';
// import 'package:goldapp/src/Home_Views/Home_View/Home_ViewWidgets/fetchdata-controller.dart';
// import 'package:goldapp/src/Home_Views/Home_View/gold-HomeView.dart';
// import 'package:goldapp/src/common_widgets/MyButton.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'history_Controller.dart';
//
// class HistoryView extends StatefulWidget {
//   const HistoryView({super.key});
//
//   @override
//   State<HistoryView> createState() => _HistoryViewState();
// }
//
// class _HistoryViewState extends State<HistoryView> {
//   String userId='';
//
//   // current logedin user id fetch
//
//   @override
//   Widget build(BuildContext context) {
//      HistoryController historyController = Get.put(HistoryController());
//     HomeFetchDataController controller=Get.put(HomeFetchDataController());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         leading: IconButton(onPressed: (){
//           Get.to(()=>GoldShop());
//         },icon: Icon(Icons.arrow_back),),
//       ),
//       backgroundColor: Colors.black,
//       body:
//       // Column(
//       //   children: [
//       // Obx(()=>
//       //
//       //     TextFormField(
//       //       controller: controller.searchController,
//       //       onChanged: (String value) {
//       //
//       //         controller.searchText.value = value;
//       //
//       //       },
//       //       decoration: InputDecoration(
//       //         border: OutlineInputBorder(
//       //           borderRadius: BorderRadius.circular(15),
//       //         ),
//       //         hintText: "Search",
//       //         prefixIcon: Icon(Icons.search),
//       //       ),
//       //     ),),
//       StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection(controller.userId.value).snapshots(),
//           builder: (context,snapshots)
//           {
//             final data=snapshots.requireData;
//
//             return ListView.builder(
//                 itemCount: data.size,
//                 itemBuilder: (context,index)
//                 {
//                   String goldprice=data.docs[index]['tolaPrice'].toString();
//                   String tolaQuantity=data.docs[index]['tolaQuantity'].toString();
//                   String goldgramQuantity=data.docs[index]['goldgramQuantity'].toString();
//                   String goldRatiQuantity=data.docs[index]['goldRatiQuantity'].toString();
//                   String goldpointQuantity =data.docs[index]['goldpointQuantity'].toString();
//                   String totalPrice=data.docs[index]['totalPrice'].toString();
//
//                   return ListTile(
//                       title: TextWidget(txt:'goldprice: $goldprice',clr: Colors.amber,),
//                       subtitle: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TextWidget(txt:'tolaQuantity: $tolaQuantity',clr: Colors.amber,),
//                           TextWidget(txt:'goldgramQuantity: $goldgramQuantity',clr: Colors.amber,),
//                           TextWidget(txt:'goldRatiQuantity: $goldRatiQuantity',clr: Colors.amber,),
//                           TextWidget(txt:'goldpointQuantity: $goldpointQuantity',clr: Colors.amber,),
//                           TextWidget(txt:'totalPrice: $totalPrice',clr: Colors.amber,),
//                         ],
//                       ),
//                       trailing:
//                       IconButton(onPressed: (){
//
//                         Get.defaultDialog(
//                           backgroundColor: Colors.amber,
//                           title: 'Message',
//                           content: Text('Do you want to Delete this Data?'),
//                           actions: [
//                             MyButton(txt: 'Yes',font: 16, w: 50.w, h:40.h , bacclr: Colors.amber, clr: Colors.black, ontap: (){
//                               FirebaseFirestore.instance
//                                   .collection(controller.userId.value)
//                                   .doc(data.docs[index].id)
//                                   .delete();
//                               Get.back();
//                             }),
//                             MyButton(txt: 'No',font: 16, w: 50.w, h:40.h , bacclr: Colors.amber, clr: Colors.black, ontap: (){
//
//                               Get.back();
//                             }),
//
//                           ],
//                         );
//
//                       },icon: Icon(Icons.delete),color: Colors.amber,)
//
//                   );
//
//                 }
//             );
//
//           }
// =======
//   @override
//   Widget build(BuildContext context) {
//    // HistoryController controller = Get.put(HistoryController());
//
//     // return SingleChildScrollView(
//     //   child: Scaffold(
//     //     appBar: AppBar(
//     //       backgroundColor: Colors.amber,
//     //       leading: IconButton(onPressed: (){
//     //         Get.to(()=>GoldShop());
//     //       },icon: Icon(Icons.arrow_back),),
//     //     ),
//     //     backgroundColor: Colors.black,
//     //     body:
//         // Column(
//         //   children: [
//            // Obx(()=>
//            //
//            //     TextFormField(
//            //       controller: controller.searchController,
//            //       onChanged: (String value) {
//            //
//            //         controller.searchText.value = value;
//            //
//            //       },
//            //       decoration: InputDecoration(
//            //         border: OutlineInputBorder(
//            //           borderRadius: BorderRadius.circular(15),
//            //         ),
//            //         hintText: "Search",
//            //         prefixIcon: Icon(Icons.search),
//            //       ),
//            //     ),),
//         //     StreamBuilder<QuerySnapshot>(
//         //       stream: FirebaseFirestore.instance.collection(userId).snapshots(),
//         //       builder: (context,snapshots)
//         //       {
//         //         final data=snapshots.requireData;
//         //
//         //         return ListView.builder(
//         //             itemCount: data.size,
//         //             itemBuilder: (context,index)
//         //       {
//         //       String goldprice=data.docs[index]['tolaPrice'].toString();
//         //       String tolaQuantity=data.docs[index]['tolaQuantity'].toString();
//         //       String goldgramQuantity=data.docs[index]['goldgramQuantity'].toString();
//         //       String goldRatiQuantity=data.docs[index]['goldRatiQuantity'].toString();
//         //       String goldpointQuantity =data.docs[index]['goldpointQuantity'].toString();
//         //       String totalPrice=data.docs[index]['totalPrice'].toString();
//         //
//         //       return ListTile(
//         //         title: TextWidget(txt:'goldprice: $goldprice',clr: Colors.amber,),
//         //         subtitle: Column(
//         //           mainAxisAlignment: MainAxisAlignment.start,
//         //           crossAxisAlignment: CrossAxisAlignment.start,
//         //           children: [
//         //             TextWidget(txt:'tolaQuantity: $tolaQuantity',clr: Colors.amber,),
//         //             TextWidget(txt:'goldgramQuantity: $goldgramQuantity',clr: Colors.amber,),
//         //             TextWidget(txt:'goldRatiQuantity: $goldRatiQuantity',clr: Colors.amber,),
//         //             TextWidget(txt:'goldpointQuantity: $goldpointQuantity',clr: Colors.amber,),
//         //             TextWidget(txt:'totalPrice: $totalPrice',clr: Colors.amber,),
//         //           ],
//         //         ),
//         //            trailing:
//         //           IconButton(onPressed: (){
//         //
//         //             Get.defaultDialog(
//         //                              backgroundColor: Colors.amber,
//         //                              title: 'Message',
//         //                              content: Text('Do you want to Delete this Data?'),
//         //                              actions: [
//         //                                MyButton(txt: 'Yes',font: 16, w: 50.w, h:40.h , bacclr: Colors.amber, clr: Colors.black, ontap: (){
//         //                                  // FirebaseFirestore.instance
//         //                                  //     .collection(userEmail)
//         //                                  //     .doc(data.docs[index].id)
//         //                                  //     .delete();
//         //                                  Get.back();
//         //                                }),
//         //                                MyButton(txt: 'No',font: 16, w: 50.w, h:40.h , bacclr: Colors.amber, clr: Colors.black, ontap: (){
//         //
//         //                                  Get.back();
//         //                                }),
//         //
//         //                              ],
//         //                            );
//         //
//         //           },icon: Icon(Icons.delete),color: Colors.amber,)
//         //
//         //       );
//         //
//         //       }
//         //           );
//         //
//         //         }
//         //         ),
//         // //  ],
//         // //)
//
//     )
//
//   );
//       //  ],
//       //)
//
//
//
//
//   }
// }


//------------
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/Home_Views/History_View/history_Controller.dart';
import 'package:goldapp/src/Home_Views/Home_View/Home_ViewWidgets/fetchdata-controller.dart';
import 'package:goldapp/src/Home_Views/Home_View/gold-HomeView.dart';
import 'package:goldapp/src/common_widgets/MyButton.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    // Controllers
    final historyController = Get.put(HistoryController());
    final homeController = Get.put(HomeFetchDataController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          onPressed: () {
            Get.to(() => const GoldShop());
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.black,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(homeController.userId.value)
            .snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshots.hasError) {
            return Center(child: Text('Error: ${snapshots.error}'));
          }
          if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No data available',
                style: TextStyle(color: Colors.amber),
              ),
            );
          }

          final data = snapshots.data!;

          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              final doc = data.docs[index];
              final goldprice = doc['tolaPrice'].toString();
              final tolaQuantity = doc['tolaQuantity'].toString();
              final goldgramQuantity = doc['goldgramQuantity'].toString();
              final goldRatiQuantity = doc['goldRatiQuantity'].toString();
              final goldpointQuantity = doc['goldpointQuantity'].toString();
              final totalPrice = doc['totalPrice'].toString();
              String docId=data.docs[index]['doc'].toString()??"";
              return ListTile(
                title: Text(
                  'Gold Price: $goldprice',
                  style: const TextStyle(color: Colors.amber),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tola Quantity: $tolaQuantity', style: const TextStyle(color: Colors.amber)),
                    Text('Gold Gram Quantity: $goldgramQuantity', style: const TextStyle(color: Colors.amber)),
                    Text('Gold Rati Quantity: $goldRatiQuantity', style: const TextStyle(color: Colors.amber)),
                    Text('Gold Point Quantity: $goldpointQuantity', style: const TextStyle(color: Colors.amber)),
                    Text('Total Price: $totalPrice', style: const TextStyle(color: Colors.amber)),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      backgroundColor: Colors.amber,
                      title: 'Message',
                      content: const Text('Do you want to delete this data?'),
                      actions: [
                        MyButton(
                          txt: 'Yes',
                          font: 16,
                          w: 50.w,
                          h: 40.h,
                          bacclr: Colors.amber,
                          clr: Colors.black,
                          ontap: () async{
                            await  FirebaseFirestore.instance
                                .collection(homeController.userId.value)
                               // .doc(data.docs[index].id)
                                .doc(docId)
                                .delete();
                            Get.back();
                          },
                        ),
                        MyButton(
                          txt: 'No',
                          font: 16,
                          w: 50.w,
                          h: 40.h,
                          bacclr: Colors.amber,
                          clr: Colors.black,
                          ontap: () {
                            Get.back();
                          },
                        ),
                      ],
                    );
                  },
                  icon: const Icon(Icons.delete, color: Colors.amber),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
