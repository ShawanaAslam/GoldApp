import '../../../utills/linker.dart';
import '../../auth_View/Shop_InformationView/shop_InformationController.dart';

class BillingController extends GetxController {
  TextEditingController clientNameController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  var isLoading = false.obs;

  // fetch shop data according to current uerr logedin;
  HomeFetchDataController controller = Get.put(HomeFetchDataController());
  ShopInfoController shopInfo = Get.put(ShopInfoController());

  void billingAdd(String goldprice, String tolaQuantity, String gramsQuantity,
      String ratiQuantity, String totalPrice) async {
    // craeet collection name BillingHistory,
    try {
      await FirebaseFirestore.instance
          .collection('billingHistory')
          .doc(controller.userId.value)
          .set({'docId': controller.userId.value});
      //--------------------------
      String subDocId = DateTime.now().microsecondsSinceEpoch.toString();
      await FirebaseFirestore.instance
          .collection('billingHistory')
          .doc(controller.userId.value)
          .collection('history')
          .doc(subDocId)
          .set({
        'clientName': clientNameController.text,
        'product': productController.text,
        'date': DateController.text,
        'goldPrice': goldprice,
        'tolaQuantity': tolaQuantity,
        'gramsQuantity': gramsQuantity,
        'ratiQuantity': ratiQuantity,
        'totalPrice': totalPrice,
        'subDocId': subDocId,
        // 'userId': controller.userId.value,
        //'docId': controller.userId.value,
        //'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {}
  }
  //BillingController obj = Get.put(BillingController());

  // Future<void> createAndOpenPDF(String goldprice,tolaQuantity,gramsQuantity,
  //     ratiQuantity,totalPrice) async {
  //   final pdf = pw.Document();
  //
  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Column(
  //         crossAxisAlignment: pw.CrossAxisAlignment.start,
  //         children: [
  //           pw.Row(
  //               // mainAxisAlignment:MainAxisAlignment.spaceBetween,
  //               children: [
  //                 pw.Text('Shop Name : ${shopInfo.shopnameController.text}',
  //                     style: pw.TextStyle(
  //                         fontSize: 22, fontWeight: pw.FontWeight.bold)),
  //                 pw.Column(children: [
  //                   pw.Text('Date : ${obj.DateController.text}'),
  //                   pw.Text('Mobile No1 : ${shopInfo.mblno1Controller.text}'),
  //                   pw.Text('Mobile No2 : ${shopInfo.mblno2Controller.text}'),
  //                   pw.Text('Ptcl No : ${shopInfo.ptclController.text}'),
  //                 ])
  //               ]),
  //           pw.Text(
  //             'Shop Email : ${shopInfo.shopemailController.text}',
  //           ),
  //           pw.SizedBox(height: 10),
  //           pw.Text('Client Name : ${obj.clientNameController.text}',
  //               style:
  //                   pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
  //           pw.SizedBox(height: 10),
  //           pw.Text('Product Name : ${obj.productController.text}'),
  //           pw.SizedBox(height: 10),
  //           pw.Text('Billing Details',
  //               style:
  //                   pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
  //           pw.SizedBox(height: 10),
  //           pw.Text('Gold Price : ${goldprice}'),
  //           pw.SizedBox(height: 5),
  //           pw.Text('Tola Quantity : ${tolaQuantity}'),
  //           pw.SizedBox(height: 5),
  //           pw.Text('Grams Quantity : ${gramsQuantity}'),
  //           pw.SizedBox(height: 5),
  //           pw.Text('Rati Quantity : ${ratiQuantity}'),
  //           pw.SizedBox(height: 5),
  //           pw.Text('Total Price : ${totalPrice}'),
  //           //.gAstoStrinFixed(2)
  //         ],
  //       ),
  //     ),
  //   );
  //
  //   try {
  //     isLoading.value = true;
  //     final directory = await getApplicationDocumentsDirectory();
  //     final filePath =
  //         '${directory.path}/ ${obj.clientNameController.text}.pdf';
  //     // '//billing_details.pdf';
  //     final file = File(filePath);
  //     await file.writeAsBytes(await pdf.save());
  //
  //     await OpenFilex.open(filePath);
  //   } catch (e) {
  //     isLoading.value = false;
  //     Get.snackbar('Error', 'Failed to create or open PDF: $e');
  //   }
  // }
}
