import 'package:goldapp/src/utills/linker.dart';

class BillingHistoryView extends StatefulWidget {
  const BillingHistoryView({Key? key}) : super(key: key);

  @override
  State<BillingHistoryView> createState() => _BillingHistoryViewState();
}

class _BillingHistoryViewState extends State<BillingHistoryView> {
  // Future<void> deleteCollection() async {
  //   try {
  //     String collectionName = homeController.userId.value;
  //     final collectionRef =
  //         await FirebaseFirestore.instance.collection(collectionName);
  //     final snapshot = await collectionRef.get();
  //     // 4th for each
  //     //for(int i=1;i<=10;i++){}
  //
  //     for (var doc in snapshot.docs) {
  //       await doc.reference.delete();
  //     }
  //   } catch (e) {
  //     print('error clearing history');
  //   }
  // }

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
            txt: 'Billing History',
            font: 22,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  //  confirmation dialog
                  //  historyController.DialogBox(docId);
                  Get.defaultDialog(
                    backgroundColor: Colors.amber,
                    title: 'Message',
                    content: const Text('Clear All History Data?'),
                    actions: [
                      MyButton(
                        txt: 'Yes',
                        font: 16,
                        w: 70.w,
                        h: 40.h,
                        bacclr: Colors.amber,
                        clr: Colors.black,
                        ontap: () {
                          historyController.deleteCollection();
                          Get.back();
                        },
                      ),
                      MyButton(
                        txt: 'No',
                        font: 16,
                        w: 70.w,
                        h: 40.h,
                        bacclr: Colors.amber,
                        clr: Colors.black,
                        ontap: () {
                          Get.back();
                        },
                      ),
                    ],
                  );
                }
                //historyController.deleteCollection();
                // },
                )
          ],
        ),
        backgroundColor: Colors.black,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('billingHistory')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('history')
                .snapshots(),
            builder: (context, snapshots) {
              final data = snapshots.data!;
              return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                    data.docs[index]['clientName'],
                    style: TextStyle(color: Colors.yellow),
                  ));
                },
              );
            }));
  }
}
