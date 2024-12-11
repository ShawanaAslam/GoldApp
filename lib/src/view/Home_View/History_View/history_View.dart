// // //import 'dart:ffi';
// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:goldapp/src/Home_Views/History_View/History_widgets/txt_Widget.dart';
// // import 'package:goldapp/src/Home_Views/Home_View/Home_ViewWidgets/fetchdata-controller.dart';
// // import 'package:goldapp/src/Home_Views/Home_View/gold-HomeView.dart';
// // import 'package:goldapp/src/common_widgets/MyButton.dart';
// // import 'package:google_fonts/google_fonts.dart';
// //
// // import 'history_Controller.dart';
// //
// // class HistoryView extends StatefulWidget {
// //   const HistoryView({super.key});
// //
// //   @override
// //   State<HistoryView> createState() => _HistoryViewState();
// // }
// //
// // class _HistoryViewState extends State<HistoryView> {
// //   String userId='';
// //
// //   // current logedin user id fetch
// //
// //   @override
// //   Widget build(BuildContext context) {
// //      HistoryController historyController = Get.put(HistoryController());
// //     HomeFetchDataController controller=Get.put(HomeFetchDataController());
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.amber,
// //         leading: IconButton(onPressed: (){
// //           Get.to(()=>GoldShop());
// //         },icon: Icon(Icons.arrow_back),),
// //       ),
// //       backgroundColor: Colors.black,
// //       body:
// //       // Column(
// //       //   children: [
// //       // Obx(()=>
// //       //
// //       //     TextFormField(
// //       //       controller: controller.searchController,
// //       //       onChanged: (String value) {
// //       //
// //       //         controller.searchText.value = value;
// //       //
// //       //       },
// //       //       decoration: InputDecoration(
// //       //         border: OutlineInputBorder(
// //       //           borderRadius: BorderRadius.circular(15),
// //       //         ),
// //       //         hintText: "Search",
// //       //         prefixIcon: Icon(Icons.search),
// //       //       ),
// //       //     ),),
// //       StreamBuilder<QuerySnapshot>(
// //           stream: FirebaseFirestore.instance.collection(controller.userId.value).snapshots(),
// //           builder: (context,snapshots)
// //           {
// //             final data=snapshots.requireData;
// //
// //             return ListView.builder(
// //                 itemCount: data.size,
// //                 itemBuilder: (context,index)
// //                 {
// //                   String goldprice=data.docs[index]['tolaPrice'].toString();
// //                   String tolaQuantity=data.docs[index]['tolaQuantity'].toString();
// //                   String goldgramQuantity=data.docs[index]['goldgramQuantity'].toString();
// //                   String goldRatiQuantity=data.docs[index]['goldRatiQuantity'].toString();
// //                   String goldpointQuantity =data.docs[index]['goldpointQuantity'].toString();
// //                   String totalPrice=data.docs[index]['totalPrice'].toString();
// //
// //                   return ListTile(
// //                       title: TextWidget(txt:'goldprice: $goldprice',clr: Colors.amber,),
// //                       subtitle: Column(
// //                         mainAxisAlignment: MainAxisAlignment.start,
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           TextWidget(txt:'tolaQuantity: $tolaQuantity',clr: Colors.amber,),
// //                           TextWidget(txt:'goldgramQuantity: $goldgramQuantity',clr: Colors.amber,),
// //                           TextWidget(txt:'goldRatiQuantity: $goldRatiQuantity',clr: Colors.amber,),
// //                           TextWidget(txt:'goldpointQuantity: $goldpointQuantity',clr: Colors.amber,),
// //                           TextWidget(txt:'totalPrice: $totalPrice',clr: Colors.amber,),
// //                         ],
// //                       ),
// //                       trailing:
// //                       IconButton(onPressed: (){
// //
// //                         Get.defaultDialog(
// //                           backgroundColor: Colors.amber,
// //                           title: 'Message',
// //                           content: Text('Do you want to Delete this Data?'),
// //                           actions: [
// //                             MyButton(txt: 'Yes',font: 16, w: 50.w, h:40.h , bacclr: Colors.amber, clr: Colors.black, ontap: (){
// //                               FirebaseFirestore.instance
// //                                   .collection(controller.userId.value)
// //                                   .doc(data.docs[index].id)
// //                                   .delete();
// //                               Get.back();
// //                             }),
// //                             MyButton(txt: 'No',font: 16, w: 50.w, h:40.h , bacclr: Colors.amber, clr: Colors.black, ontap: (){
// //
// //                               Get.back();
// //                             }),
// //
// //                           ],
// //                         );
// //
// //                       },icon: Icon(Icons.delete),color: Colors.amber,)
// //
// //                   );
// //
// //                 }
// //             );
// //
// //           }
// // =======
// //   @override
// //   Widget build(BuildContext context) {
// //    // HistoryController controller = Get.put(HistoryController());
// //
// //     // return SingleChildScrollView(
// //     //   child: Scaffold(
// //     //     appBar: AppBar(
// //     //       backgroundColor: Colors.amber,
// //     //       leading: IconButton(onPressed: (){
// //     //         Get.to(()=>GoldShop());
// //     //       },icon: Icon(Icons.arrow_back),),
// //     //     ),
// //     //     backgroundColor: Colors.black,
// //     //     body:
// //         // Column(
// //         //   children: [
// //            // Obx(()=>
// //            //
// //            //     TextFormField(
// //            //       controller: controller.searchController,
// //            //       onChanged: (String value) {
// //            //
// //            //         controller.searchText.value = value;
// //            //
// //            //       },
// //            //       decoration: InputDecoration(
// //            //         border: OutlineInputBorder(
// //            //           borderRadius: BorderRadius.circular(15),
// //            //         ),
// //            //         hintText: "Search",
// //            //         prefixIcon: Icon(Icons.search),
// //            //       ),
// //            //     ),),
// //         //     StreamBuilder<QuerySnapshot>(
// //         //       stream: FirebaseFirestore.instance.collection(userId).snapshots(),
// //         //       builder: (context,snapshots)
// //         //       {
// //         //         final data=snapshots.requireData;
// //         //
// //         //         return ListView.builder(
// //         //             itemCount: data.size,
// //         //             itemBuilder: (context,index)
// //         //       {
// //         //       String goldprice=data.docs[index]['tolaPrice'].toString();
// //         //       String tolaQuantity=data.docs[index]['tolaQuantity'].toString();
// //         //       String goldgramQuantity=data.docs[index]['goldgramQuantity'].toString();
// //         //       String goldRatiQuantity=data.docs[index]['goldRatiQuantity'].toString();
// //         //       String goldpointQuantity =data.docs[index]['goldpointQuantity'].toString();
// //         //       String totalPrice=data.docs[index]['totalPrice'].toString();
// //         //
// //         //       return ListTile(
// //         //         title: TextWidget(txt:'goldprice: $goldprice',clr: Colors.amber,),
// //         //         subtitle: Column(
// //         //           mainAxisAlignment: MainAxisAlignment.start,
// //         //           crossAxisAlignment: CrossAxisAlignment.start,
// //         //           children: [
// //         //             TextWidget(txt:'tolaQuantity: $tolaQuantity',clr: Colors.amber,),
// //         //             TextWidget(txt:'goldgramQuantity: $goldgramQuantity',clr: Colors.amber,),
// //         //             TextWidget(txt:'goldRatiQuantity: $goldRatiQuantity',clr: Colors.amber,),
// //         //             TextWidget(txt:'goldpointQuantity: $goldpointQuantity',clr: Colors.amber,),
// //         //             TextWidget(txt:'totalPrice: $totalPrice',clr: Colors.amber,),
// //         //           ],
// //         //         ),
// //         //            trailing:
// //         //           IconButton(onPressed: (){
// //         //
// //         //             Get.defaultDialog(
// //         //                              backgroundColor: Colors.amber,
// //         //                              title: 'Message',
// //         //                              content: Text('Do you want to Delete this Data?'),
// //         //                              actions: [
// //         //                                MyButton(txt: 'Yes',font: 16, w: 50.w, h:40.h , bacclr: Colors.amber, clr: Colors.black, ontap: (){
// //         //                                  // FirebaseFirestore.instance
// //         //                                  //     .collection(userEmail)
// //         //                                  //     .doc(data.docs[index].id)
// //         //                                  //     .delete();
// //         //                                  Get.back();
// //         //                                }),
// //         //                                MyButton(txt: 'No',font: 16, w: 50.w, h:40.h , bacclr: Colors.amber, clr: Colors.black, ontap: (){
// //         //
// //         //                                  Get.back();
// //         //                                }),
// //         //
// //         //                              ],
// //         //                            );
// //         //
// //         //           },icon: Icon(Icons.delete),color: Colors.amber,)
// //         //
// //         //       );
// //         //
// //         //       }
// //         //           );
// //         //
// //         //         }
// //         //         ),
// //         // //  ],
// //         // //)
// //
// //     )
// //
// //   );
// //       //  ],
// //       //)
// //
// //
// //
// //
// //   }
// // }
//
//
// //------------
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/utills/Loading_Effect/app_Loading.dart';
import 'package:goldapp/src/view/Home_View/History_View/history_Controller.dart';
import 'package:goldapp/src/view/Home_View/home_View/home_ViewWidgets/fetchdata-controller.dart';
import 'package:goldapp/src/view/Home_View/home_View/gold-HomeView.dart';
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
      body: Column(children: [
        Expanded(
            flex: 2,
            child: Container(
              
            )),
        Expanded(
          flex: 8,
          child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(homeController.userId.value)
              .snapshots(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return const Center(child: AppLoading());
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
                    '($goldprice x $tolaQuantity)+gramPrice + rattiPrice +pointsPrice',
                    style: const TextStyle(color: Colors.amber),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  Text('Tola Quantity: $tolaQuantity', style: const TextStyle(color: Colors.amber)),
                      // Text('Gold Gram Quantity: $goldgramQuantity', style: const TextStyle(color: Colors.amber)),
                      //Text('Gold Rati Quantity: $goldRatiQuantity', style: const TextStyle(color: Colors.amber)),
                      //Text('Gold Point Quantity: $goldpointQuantity', style: const TextStyle(color: Colors.amber)),
                      Text('=$totalPrice', style: const TextStyle(color: Colors.amber)),
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
        ),)
      ],)
    );
  }
}


//--------------------------------------------------------
//------------------------------------------------------
// import 'package:flutter/material.dart';
//
// class HistoryView extends StatefulWidget {
//   final List<String> history;
//
//   HistoryView({required this.history});
//
//   @override
//   State<HistoryView> createState() => _HistoryViewState();
// }
//
// class _HistoryViewState extends State<HistoryView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calculation History'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () {
//               // Warning: Only return here and clear history in the parent screen
//               Navigator.pop(context, true); // Notify parent to clear history
//             },
//           ),
//         ],
//       ),
//       body: widget.history.isEmpty
//           ? Center(
//         child: Text(
//           'No history available',
//           style: TextStyle(fontSize: 18),
//         ),
//       )
//           : ListView.builder(
//         itemCount: widget.history.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(widget.history[index]),
//           );
//         },
//       ),
//     );
//   }
// }
// //--------------------------------------------------------------
// class CalculatorScreen extends StatefulWidget {
//   @override
//   _CalculatorScreenState createState() => _CalculatorScreenState();
// }
//
// class _CalculatorScreenState extends State<CalculatorScreen> {
//   final TextEditingController _num1Controller = TextEditingController();
//   final TextEditingController _num2Controller = TextEditingController();
//   String _result = '';
//   List<String> _history = [];
//
//   void _calculate(String operation) {
//     double num1 = double.tryParse(_num1Controller.text) ?? 0;
//     double num2 = double.tryParse(_num2Controller.text) ?? 0;
//     double result;
//
//     switch (operation) {
//       case '+':
//         result = num1 + num2;
//         break;
//       case '-':
//         result = num1 - num2;
//         break;
//       case '*':
//         result = num1 * num2;
//         break;
//       default:
//         result = 0;
//     }
//
//     setState(() {
//       _result = result.toString();
//       _history.add('$num1 $operation $num2 = $_result');
//     });
//   }
//
//   void _navigateToHistory() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => HistoryView(history: _history),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calculator'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.history),
//             onPressed: _navigateToHistory,
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _num1Controller,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Enter first number'),
//             ),
//             TextField(
//               controller: _num2Controller,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Enter second number'),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _calculate('+'),
//                   child: Text('+'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _calculate('-'),
//                   child: Text('-'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _calculate('*'),
//                   child: Text('*'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Result: $_result',
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//------------------------------------------------

// void _navigateToHistory(
//     BuildContext context
//     ) async {
//   bool? shouldClear = await Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => HistoryView(history: _history),
//     ),
//   );
//
//   if (shouldClear == true) {
//     setState(() {
//       _history.clear();
//     });
//   }
// }
