import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:goldapp/src/utills/linker.dart';
import 'package:path_provider/path_provider.dart';

class BillingController extends GetxController {
  TextEditingController clientNameController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  // var isLoading= false.obs;

  // fetch shop data according to current uerr logedin;
  HomeFetchDataController controller = Get.put(HomeFetchDataController());

  // Future<void> _createAndOpenPDF() async {
  //
  //   final pdf = pw.Document();
  //
  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Column(
  //         crossAxisAlignment: pw.CrossAxisAlignment.start,
  //         children: [
  //           pw.Row(
  //             // mainAxisAlignment:MainAxisAlignment.spaceBetween,
  //               children: [
  //                 pw.Text('Shop Name : ${shopInfo.shopnameController.text}',
  //                     style:
  //                     pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold)),
  //                 pw.Column(
  //                     children: [
  //                       pw.Text('Date : ${obj.DateController.text}'),
  //                       pw.Text('Mobile No1 : ${shopInfo.mblno1Controller.text}'),
  //                       pw.Text('Mobile No2 : ${shopInfo.mblno2Controller.text}'),
  //                       pw.Text('Ptcl No : ${shopInfo.ptclController.text}'),
  //                     ]
  //                 )
  //               ]),
  //
  //           pw.Text('Shop Email : ${shopInfo.shopemailController.text}',),
  //           pw.SizedBox(height: 10),
  //
  //           pw.Text('Client Name : ${obj.clientNameController.text}',
  //               style:
  //               pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
  //           pw.SizedBox(height: 10),
  //           pw.Text('Product Name : ${obj.productController.text}'),
  //           pw.SizedBox(height: 10),
  //           pw.Text('Billing Details',
  //               style:
  //               pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
  //           pw.SizedBox(height: 10),
  //           pw.Text('Gold Price : ${widget.goldPrice}'),
  //           pw.SizedBox(height: 5),
  //           pw.Text('Tola Quantity : ${widget.tolaQuantity}'),
  //           pw.SizedBox(height: 5),
  //           pw.Text('Grams Quantity : ${widget.gramsQuantity}'),
  //           pw.SizedBox(height: 5),
  //           pw.Text('Rati Quantity : ${widget.ratiQuantity}'),
  //           pw.SizedBox(height: 5),
  //           pw.Text('Total Price : ${widget.totalPrice.toStringAsFixed(2)}'),
  //         ],
  //       ),
  //     ),
  //   );
  //
  //   try {
  //     isLoading.value = true;
  //     final directory = await getApplicationDocumentsDirectory();
  //     final filePath = '${directory.path}/ ${obj.clientNameController.text}.pdf';
  //     // '//billing_details.pdf';
  //     final file = File(filePath);
  //     await file.writeAsBytes(await pdf.save());
  //
  //
  //     await OpenFilex.open(filePath);
  //   } catch (e) {
  //     isLoading.value = false;
  //     Get.snackbar('Error', 'Failed to create or open PDF: $e');
  //   }
  // }
}
