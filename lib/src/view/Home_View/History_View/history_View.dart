

import 'package:goldapp/src/common_widgets/reusable_text.dart';
import 'package:goldapp/src/utills/linker.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  Future<void> deleteCollection() async {
    try {
      String collectionName = homeController.userId.value;
      final collectionRef =
          await FirebaseFirestore.instance.collection(collectionName);
      final snapshot = await collectionRef.get();
      // 4th for each
      //for(int i=1;i<=10;i++){}

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print('error clearing history');
    }
  }

  final homeController = Get.put(HomeFetchDataController());
  @override
  Widget build(BuildContext context) {
    // Controllers
    final historyController = Get.put(HistoryController());

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
          actions: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
//confirmation dialog

                deleteCollection();
              },
            )
          ],
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
                            content:  MyText(
                               txt:  '( goldPrice x tola ) + grams + ratti + points = totalPrice'),
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
                        title: MyText(txt:
                          '($goldprice x $tolaQuantity)+($goldprice/12 x $goldgramQuantity) + ($goldprice/96 X $goldRatiQuantity) +($goldprice/100 x $goldpointQuantity)',
                          txtclr: AppColors.secondryColor,

                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            MyText(txt: '=$totalPrice',
                                txtclr: AppColors.secondryColor,

                            ),
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
