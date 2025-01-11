

import 'dart:io';

import 'package:goldapp/src/view/Home_View/home_View/gold%20HomeViewController.dart';

import '../../../Constants/images.dart';

import 'package:pdf/widgets.dart' as pw;
import '../../../utills/linker.dart';
import '../../auth_View/Shop_InformationView/shop_InformationController.dart';
import 'BillingPreview_Widgets/DateTimePicker_TextFormField.dart';
import 'BillingPreview_Widgets/billing_TextFormField.dart';
import 'billingPreview_Controller.dart';

class BillingPreview extends StatefulWidget {
  String goldPrice;
  String tolaQuantity;
  String gramsQuantity;
  String ratiQuantity;
  String pointsQuantity;
  double totalPrice;

  BillingPreview({
    super.key,
    required this.goldPrice,
    required this.tolaQuantity,
    required this.gramsQuantity,
    required this.ratiQuantity,
    required this.pointsQuantity,
    required this.totalPrice,
  });

  @override
  State<BillingPreview> createState() => _BillingPreviewState();
}

class _BillingPreviewState extends State<BillingPreview> {
  BillingController obj = Get.put(BillingController());
  ShopInfoController shopInfo = Get.put(ShopInfoController());
  GoldShopController goldShop = Get.put(GoldShopController());
  bool isLoading = false; // To manage loading spinner

  @override
  void initState() {
    super.initState();
    goldShop.refresh();
    obj.refresh();
//    obj.goldpricee.value = widget.goldPrice;
  }

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
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.SizedBox(height: 40),
                      pw.Text(
                        'Shop Address : ${shopInfo.shopaddress.value}',
                        style: pw.TextStyle(
                          fontSize: 22,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.amber, // Set text color to amber
                        ),
                      ),
                      pw.Text(
                        'Mobile No1 : ${shopInfo.mblno1.value}',
                        style: pw.TextStyle(color: PdfColors.amber),
                      ),
                      pw.Text(
                        'Mobile No2 : ${shopInfo.mblno2.value}',
                        style: pw.TextStyle(color: PdfColors.amber),
                      ),
                      pw.Text(
                        'Ptcl No : ${shopInfo.ptcl.value}',
                        style: pw.TextStyle(color: PdfColors.amber),
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 40),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Shop Name : ${shopInfo.shopname.value}',
                    style: pw.TextStyle(
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.amber, // Set text color to amber
                    ),
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Date : ${obj.DateController.text}',
                        style: pw.TextStyle(color: PdfColors.amber),
                      ),
                    ],
                  ),
                ],
              ),
              pw.Text(
                'Shop Email : ${shopInfo.shopemail.value}',
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
                'Points Quantity : ${widget.pointsQuantity}',
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
      floatingActionButton: isLoading
          ? AppLoading() // Show loading spinner while creating PDF
          : FloatingActionButton(
              backgroundColor: AppColors.secondryColor,
              onPressed: () async {
                if (key.currentState!.validate()) {
                  obj.billingAdd(
                    widget.goldPrice.toString(),
                    widget.tolaQuantity.toString(),
                    widget.gramsQuantity.toString(),
                    widget.ratiQuantity.toString(),
                    widget.pointsQuantity.toString(),
                    widget.totalPrice.toString(),
                  );
                  _createAndOpenPDF();
                  //   createAndOpenPDF(widget.goldPrice,widget.tolaQuantity,
                  // widget.gramsQuantity,widget.ratiQuantity,widget.pointsQuantity);
                }
              },
              child:
                  //isLoading?AppLoading():
                  const Icon(
                Icons.picture_as_pdf,
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
                    padding: const EdgeInsets.only(left: 13, right: 13),
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
                      Text(
                        'Points Quantity : ${widget.pointsQuantity}',
                        style: TextStyle(color: AppColors.secondryColor),
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
