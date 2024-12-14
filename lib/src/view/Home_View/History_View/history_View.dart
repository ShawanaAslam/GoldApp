import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/Constants/colors.dart';
import 'package:goldapp/src/common_widgets/reusable_text.dart';
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
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: MyText(
            txt: 'History Screen',
            font: 22,
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                    child: TextButton(
                        onPressed: () {
                          Get.defaultDialog(
                            backgroundColor: Colors.amber,
                            title: 'Formula',
                            content: const Text(
                                '( goldPrice x tola ) + grams + ratti + points = totalPrice'),
                          );
                        },
                        child: MyText(
                          txt: 'See Formula',
                          txtclr: AppColors.secondryColor,
                          font: 20,
                        )))),
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
                      final goldgramQuantity =
                          doc['goldgramQuantity'].toString();
                      final goldRatiQuantity =
                          doc['goldRatiQuantity'].toString();
                      final goldpointQuantity =
                          doc['goldpointQuantity'].toString();
                      final totalPrice = doc['totalPrice'].toString();
                      String docId = data.docs[index]['doc'].toString() ?? "";
                      return ListTile(
                        title: Text(
                          '($goldprice x $tolaQuantity)+($goldprice/12 x $goldgramQuantity) + ($goldprice/96 X $goldRatiQuantity) +($goldprice/100 x $goldpointQuantity)',
                          style: const TextStyle(color: Colors.amber),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //  Text('Tola Quantity: $tolaQuantity', style: const TextStyle(color: Colors.amber)),
                            // Text('Gold Gram Quantity: $goldgramQuantity', style: const TextStyle(color: Colors.amber)),
                            //Text('Gold Rati Quantity: $goldRatiQuantity', style: const TextStyle(color: Colors.amber)),
                            //Text('Gold Point Quantity: $goldpointQuantity', style: const TextStyle(color: Colors.amber)),
                            Text('=$totalPrice',
                                style: const TextStyle(color: Colors.amber)),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              backgroundColor: Colors.amber,
                              title: 'Message',
                              content: const Text(
                                  'Do you want to delete this data?'),
                              actions: [
                                MyButton(
                                  txt: 'Yes',
                                  font: 16,
                                  w: 50.w,
                                  h: 40.h,
                                  bacclr: Colors.amber,
                                  clr: Colors.black,
                                  ontap: () async {
                                    await FirebaseFirestore.instance
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
            )
          ],
        ));
  }
}
