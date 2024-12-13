import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/view/Home_View/home_View/gold%20HomeViewController.dart';

import '../../../../Constants/colors.dart';
import '../../../../common_widgets/reusable_simpletext.dart';
import '../../../../common_widgets/reusable_text.dart';

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
  GoldShopController obj = Get.put(GoldShopController());
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
          txt: 'hhh',
          font: 22,
          txtclr: AppColors.primryColor,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SimpleText(controller: ),


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
      ),
    );
  }
}
