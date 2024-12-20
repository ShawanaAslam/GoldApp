// class BillingHomeView extends StatefulWidget {
//   String goldPrice;
//   String tolaQuantity;
//   String gramsQuantity;
//   String ratiQuantity;
//   String pointsQuantity;
//   double totalPrice;

//   BillingHomeView(
//       {super.key,
//       required this.goldPrice,
//       required this.tolaQuantity,
//       required this.gramsQuantity,
//       required this.ratiQuantity,
//       required this.pointsQuantity,
//       required this.totalPrice});

//   @override
//   State<BillingHomeView> createState() => _BillingHomeViewState();
// }

// class _BillingHomeViewState extends State<BillingHomeView> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     obj.refresh();
//   }

//   BillingController obj = Get.put(BillingController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primryColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.secondryColor,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         title: MyText(
//           txt: 'Billing Preview',
//           font: 22,
//           txtclr: AppColors.primryColor,
//         ),
//         centerTitle: true,
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
//         child: FloatingActionButton(onPressed: () {}),
//       ),
//       body: Padding(
//         //padding: const EdgeInsets.only(bottom: 18,right: 20,left: 20),
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 130,
//                 ),
//                 child: DatePickerTextformfield(
//                   controller: obj.DateController,
//                   hnttxt: 'Enter Date',
//                   clr: AppColors.primryColor,
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               BillingTextFormField(
//                   // prefixicn: Icon(
//                   //   Icons.email,
//                   //   color: Colors.amber,
//                   // ),
//                   controller: obj.clientController,
//                   hnttxt: "Enter Client Name"),
//               SizedBox(
//                 height: 5,
//               ),
//               BillingTextFormField(
//                   // prefixicn: Icon(
//                   //   Icons.email,
//                   //   color: Colors.amber,
//                   // ),
//                   controller: obj.productController,
//                   hnttxt: "Enter Product Name"),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 40),
//                 child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       MyText(
//                         txt: 'Gold Price : ${widget.goldPrice}',
//                         txtclr: AppColors.secondryColor,
//                       ),
//                       MyText(
//                           txt: 'Tola Quantity : ${widget.tolaQuantity}',
//                           txtclr: AppColors.secondryColor),
//                       MyText(
//                           txt: 'Grams Quantity : ${widget.gramsQuantity}',
//                           txtclr: AppColors.secondryColor),
//                       MyText(
//                           txt: 'Rati Quantity : ${widget.ratiQuantity}',
//                           txtclr: AppColors.secondryColor),
//                       MyText(
//                           txt: 'Tola Price : ${widget.totalPrice}',
//                           txtclr: AppColors.secondryColor),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import '../../../Constants/images.dart';
import '../../../utills/linker.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../auth_View/Shop_InformationView/shop_InformationController.dart';
import 'Billing_Widgets/DateTimePicker_TextFormField.dart';
import 'Billing_Widgets/billing_TextFormField.dart';
import 'billing_Controller.dart';

class BillingHomeView extends StatefulWidget {
  String goldPrice;
  String tolaQuantity;
  String gramsQuantity;
  String ratiQuantity;
  String pointsQuantity;
  double totalPrice;

  BillingHomeView({
    super.key,
    required this.goldPrice,
    required this.tolaQuantity,
    required this.gramsQuantity,
    required this.ratiQuantity,
    required this.pointsQuantity,
    required this.totalPrice,
  });

  @override
  State<BillingHomeView> createState() => _BillingHomeViewState();
}

class _BillingHomeViewState extends State<BillingHomeView> {
  BillingController obj = Get.put(BillingController());
  ShopInfoController shopInfo = Get.put(ShopInfoController());

  bool isLoading = false; // To manage loading spinner

  @override
  void initState() {
    super.initState();
    obj.refresh();
  }

  //Function to create and open PDF

  // Future<void> _createAndOpenPDF() async {
  //   setState(() {
  //     isLoading = true; // Show loading spinner
  //   });
  //
  //   final pdf = pw.Document();
  //
  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Column(
  //         crossAxisAlignment: pw.CrossAxisAlignment.start,
  //         children: [
  //           pw.Row(
  //               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //               //crossAxisAlignment: pw.CrossAxisAlignment.spaceBetween,
  //               children: [
  //                 pw.Text('Shop Name : ${shopInfo.shopnameController.text}',
  //                     style: pw.TextStyle(
  //                         fontSize: 22, fontWeight: pw.FontWeight.bold)),
  //                 pw.Column(
  //                     mainAxisAlignment: pw.MainAxisAlignment.start,
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.SizedBox(height: 40),
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
  //   ),
  //    );
  //
  //   try {
  //     final directory = await getApplicationDocumentsDirectory();
  //     final filePath =
  //         '${directory.path}/ ${obj.clientNameController.text}.pdf';
  //     // '//billing_details.pdf';
  //     final file = File(filePath);
  //     await file.writeAsBytes(await pdf.save());
  //
  //     setState(() {
  //       isLoading = false; // Hide loading spinner
  //     });
  //
  //     await OpenFilex.open(filePath);
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false; // Hide loading spinner
  //     });
  //     Get.snackbar('Error', 'Failed to create or open PDF: $e');
  //   }
  // }

  ///
  /// pdf colors

  Future<void> _createAndOpenPDF() async {
    setState(() {
      isLoading = true; // Show loading spinner
    });

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) => pw.Container(
          color: PdfColors.black, // Set background color to black
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Shop Name : ${shopInfo.shopnameController.text}',
                    style: pw.TextStyle(
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.amber, // Set text color to amber
                    ),
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(height: 40),
                      pw.Text(
                        'Date : ${obj.DateController.text}',
                        style: pw.TextStyle(color: PdfColors.amber),
                      ),
                      pw.Text(
                        'Mobile No1 : ${shopInfo.mblno1.value}',
                        style: pw.TextStyle(color: PdfColors.amber),
                      ),
                      pw.Text(
                        'Mobile No2 : ${shopInfo.mblno2Controller.text}',
                        style: pw.TextStyle(color: PdfColors.amber),
                      ),
                      pw.Text(
                        'Ptcl No : ${shopInfo.ptclController.text}',
                        style: pw.TextStyle(color: PdfColors.amber),
                      ),
                    ],
                  ),
                ],
              ),
              pw.Text(
                'Shop Email : ${shopInfo.shopemailController.text}',
                style: pw.TextStyle(color: PdfColors.amber),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Client Name : ${obj.clientNameController.text}',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.amber,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Product Name : ${obj.productController.text}',
                style: pw.TextStyle(color: PdfColors.amber),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Billing Details',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.amber,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Gold Price : ${widget.goldPrice}',
                style: pw.TextStyle(color: PdfColors.amber),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                'Tola Quantity : ${widget.tolaQuantity}',
                style: pw.TextStyle(color: PdfColors.amber),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                'Grams Quantity : ${widget.gramsQuantity}',
                style: pw.TextStyle(color: PdfColors.amber),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                'Rati Quantity : ${widget.ratiQuantity}',
                style: pw.TextStyle(color: PdfColors.amber),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                'Total Price : ${widget.totalPrice.toStringAsFixed(2)}',
                style: pw.TextStyle(color: PdfColors.amber),
              ),
            ],
          ),
        ),
      ),
    );

    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath =
          '${directory.path}/ ${obj.clientNameController.text}.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      setState(() {
        isLoading = false; // Hide loading spinner
      });

      await OpenFilex.open(filePath);
    } catch (e) {
      setState(() {
        isLoading = false; // Hide loading spinner
      });
      Get.snackbar('Error', 'Failed to create or open PDF: $e');
    }
  }
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: MyText(
          txt: 'Billing Preview',
          font: 22,
          txtclr: AppColors.primryColor,
        ),
        centerTitle: true,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0,
        //    horizontal: 32.0
        ),
        child: isLoading
            ? AppLoading() // Show loading spinner while creating PDF
            : FloatingActionButton(
                backgroundColor: AppColors.secondryColor,
                onPressed: () {
    if (key.currentState!.validate()){
    _createAndOpenPDF();
    //   createAndOpenPDF(widget.goldPrice,widget.tolaQuantity,
    // widget.gramsQuantity,widget.ratiQuantity,widget.pointsQuantity);
    } },
                child: const Icon(
                  Icons.picture_as_pdf,
                ),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: DatePickerTextformfield(
                    controller: obj.DateController,
                    hnttxt: 'Enter Date',
                    clr: AppColors.primryColor,
                  ),
                ),
                const SizedBox(height: 30),
                BillingTextFormField(
                  prefixicn: Icon(
                    Icons.person,
                    color: AppColors.secondryColor,
                  ),
                  controller: obj.clientNameController,
                  hnttxt: "Enter Client Name",
                ),
                const SizedBox(height: 5),
                BillingTextFormField(
                  prefixicn: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset(Images.shopping,
                        width: 10, color: AppColors.secondryColor),
                  ),
                  controller: obj.productController,
                  hnttxt: "Enter Product Name",
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        txt: 'Gold Price : ${widget.goldPrice}',
                        txtclr: AppColors.secondryColor,
                      ),
                      MyText(
                        txt: 'Tola Quantity : ${widget.tolaQuantity}',
                        txtclr: AppColors.secondryColor,
                      ),
                      MyText(
                        txt: 'Grams Quantity : ${widget.gramsQuantity}',
                        txtclr: AppColors.secondryColor,
                      ),
                      MyText(
                        txt: 'Rati Quantity : ${widget.ratiQuantity}',
                        txtclr: AppColors.secondryColor,
                      ),
                      MyText(
                        txt: 'Tola Price : ${widget.totalPrice}',
                        txtclr: AppColors.secondryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
