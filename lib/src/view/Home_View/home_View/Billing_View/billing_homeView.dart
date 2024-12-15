import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/view/Home_View/home_View/Billing_View/billing_Controller.dart';
import 'package:goldapp/src/view/Home_View/home_View/gold%20HomeViewController.dart';

import '../../../../Constants/colors.dart';
import '../../../../common_widgets/reusable_simpletext.dart';
import '../../../../common_widgets/reusable_text.dart';
import '../../../../common_widgets/simpleTextForm_widget.dart';
import 'Billing_Widgets/DateTimePicker_TextFormField.dart';
import 'Billing_Widgets/billing_TextFormField.dart';

class BillingHomeView extends StatefulWidget {
  String goldPrice;
  String tolaQuantity;
  String gramsQuantity;
  String ratiQuantity;
  String pointsQuantity;
  double totalPrice;

  BillingHomeView(
      {super.key,
      required this.goldPrice,
      required this.tolaQuantity,
      required this.gramsQuantity,
      required this.ratiQuantity,
      required this.pointsQuantity,
      required this.totalPrice});


  @override
  State<BillingHomeView> createState() => _BillingHomeViewState();
}

class _BillingHomeViewState extends State<BillingHomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obj.refresh();
  }
  BillingController obj = Get.put(BillingController());
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
      body: Padding(
        //padding: const EdgeInsets.only(bottom: 18,right: 20,left: 20),
       padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 130,),
                child:
          DatePickerTextformfield(
                  controller: obj.DateController,
                hnttxt: 'Enter Date',
                clr: AppColors.primryColor,),
              ),
              SizedBox(height: 30,),
              BillingTextFormField(
                  // prefixicn: Icon(
                  //   Icons.email,
                  //   color: Colors.amber,
                  // ),
                  controller: obj.clientController,
                  hnttxt: "Enter Client Name"),

              SizedBox(height: 5,),
              BillingTextFormField(
                // prefixicn: Icon(
                //   Icons.email,
                //   color: Colors.amber,
                // ),
                  controller: obj.productController,
                  hnttxt: "Enter Product Name"),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      MyText(
                        txt: 'Gold Price : ${widget.goldPrice}',
                        txtclr: AppColors.secondryColor,
                      ),
                      MyText(
                          txt: 'Tola Quantity : ${widget.tolaQuantity}',
                          txtclr: AppColors.secondryColor),
                      MyText(
                          txt: 'Grams Quantity : ${widget.gramsQuantity}',
                          txtclr: AppColors.secondryColor),
                      MyText(
                          txt: 'Rati Quantity : ${widget.ratiQuantity}',
                          txtclr: AppColors.secondryColor),
                      MyText(
                          txt: 'Tola Price : ${widget.totalPrice}',
                          txtclr: AppColors.secondryColor),
                    ],
                  ),
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}
