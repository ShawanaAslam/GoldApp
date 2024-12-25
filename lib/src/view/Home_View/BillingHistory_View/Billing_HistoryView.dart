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
                  return ListTile(
                      title: MyText(
                       txt:  'Client Name : ${data.docs[index]['clientName']}',
                  font: 16,
                        txtclr: AppColors.secondryColor,
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                          txt:'Product Name : ${data.docs[index]['product']}',
                      font: 16,
                      txtclr: AppColors.secondryColor,),
                      MyText(
                        txt:'Gold Price : ${data.docs[index]['goldPrice']}',
                        font: 16,
                        txtclr: AppColors.secondryColor,),
                      MyText(
                        txt:'Tola Quantity : ${data.docs[index]['tolaQuantity']}',
                        font: 16,
                        txtclr: AppColors.secondryColor,),
                      MyText(
                        txt:'Grams Quantity : ${data.docs[index]['gramsQuantity']}',
                        font: 16,
                        txtclr: AppColors.secondryColor,),
                      MyText(
                        txt:'Rati Quantity : ${data.docs[index]['ratiQuantity']}',
                        font: 16,
                        txtclr: AppColors.secondryColor,),
                      MyText(
                        txt:'Points Quantity : ${data.docs[index]['ratiQuantity']}',
                        font: 16,
                        txtclr: AppColors.secondryColor,),
                      MyText(
                        txt:'Total Price : ${data.docs[index]['totalPrice']}',
                        font: 16,
                        txtclr: AppColors.secondryColor,),

                    ],
                  ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(bottom: 200),
                      child: IconButton(
                        onPressed: () {
                         // historyController.DialogBox(docId);

                        },
                        icon: const Icon(Icons.delete, color: Colors.amber),
                      ),
                    ),
                  );
                },
              );
            }));
  }
}
