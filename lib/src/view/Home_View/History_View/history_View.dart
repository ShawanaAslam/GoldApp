import 'package:goldapp/src/utills/linker.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {

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
                icon: Icon(Icons.delete),
                onPressed: () {
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
                      content: MyText(
                        txt:
                        '( goldPrice x tola ) + grams + ratti + points = totalPrice',
                      ),
                    );
                  },
                  child: MyText(
                    txt: 'See Formula',
                    txtclr: AppColors.secondryColor,
                    font: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection(homeController.userId.value)
                    .orderBy('timestamp',
                    descending: true) // Order by timestamp
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
                      String docId = doc['doc'].toString();

                      return ListTile(
                        title: MyText(
                          txt:
                          '($goldprice x $tolaQuantity)+($goldprice/12 x $goldgramQuantity) + ($goldprice/96 X $goldRatiQuantity) +($goldprice/100 x $goldpointQuantity)',
                          txtclr: AppColors.secondryColor,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              txt: '=$totalPrice',
                              txtclr: AppColors.secondryColor,
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            historyController.dialogBox(docId);
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
  }}