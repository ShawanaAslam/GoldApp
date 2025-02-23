
import 'package:goldapp/src/view/Home_View/BillingHistory_View/Billing_HistoryViewController.dart';

import '../../../utills/linker.dart';

class BillingHistoryView extends StatefulWidget {
  const BillingHistoryView({Key? key}) : super(key: key);

  @override
  State<BillingHistoryView> createState() => _BillingHistoryViewState();
}

class _BillingHistoryViewState extends State<BillingHistoryView> {


  final homeController = Get.put(HomeFetchDataController());

  @override
  Widget build(BuildContext context) {
    // Controllers
 BillingHistoryController  billingHistoryController = Get.put(BillingHistoryController());

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

                  Get.defaultDialog(
                    backgroundColor: Colors.amber,
                    title: 'Message',
                    content: const Text('Clear All Billing History Data?'),
                    actions: [
                      MyButton(
                        txt: 'Yes',
                        font: 16,
                        w: 70.w,
                        h: 40.h,
                        bacclr: Colors.amber,
                        clr: Colors.black,
                        ontap: () {
                          billingHistoryController.deleteBillingHistory();
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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('billingHistory')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('history')
                .orderBy('timestamp', descending: true)
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
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          txt:
                              'Client Name : ${data.docs[index]['clientName']}',
                          font: 16,
                          txtclr: AppColors.secondryColor,
                        ),
                        IconButton(
                          onPressed: () {
                            billingHistoryController
                                .dialogBox(data.docs[index]['subDocId']);
                          },
                          icon: const Icon(Icons.delete, color: Colors.amber),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          txt: 'Product Name : ${data.docs[index]['product']}',
                          font: 16,
                          txtclr: AppColors.secondryColor,
                        ),
                        MyText(
                          txt: 'Gold Price : ${data.docs[index]['goldPrice']}',
                          font: 16,
                          txtclr: AppColors.secondryColor,
                        ),
                        MyText(
                          txt:
                              'Tola Quantity : ${data.docs[index]['tolaQuantity']}',
                          font: 16,
                          txtclr: AppColors.secondryColor,
                        ),
                        MyText(
                          txt:
                              'Grams Quantity : ${data.docs[index]['gramsQuantity']}',
                          font: 16,
                          txtclr: AppColors.secondryColor,
                        ),
                        MyText(
                          txt:
                              'Rati Quantity : ${data.docs[index]['ratiQuantity']}',
                          font: 16,
                          txtclr: AppColors.secondryColor,
                        ),
                        MyText(
                          txt:
                              'Points Quantity : ${data.docs[index]['pointsQuantity'] ?? ""}',
                          font: 16,
                          txtclr: AppColors.secondryColor,
                        ),
                        MyText(
                          txt:
                              'Total Price : ${data.docs[index]['totalPrice']}',
                          font: 16,
                          txtclr: AppColors.secondryColor,
                        ),

                        Divider(
                          color: AppColors.secondryColor,
                        )
                      ],
                    ),

                  );
                },
              );
            }));
  }
}
