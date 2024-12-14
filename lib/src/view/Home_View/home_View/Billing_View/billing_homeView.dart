import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SimpleText(controller: ),



            MyText(
              txt: 'Gold Price : ${widget.goldPrice}',
              txtclr: AppColors.secondryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: MyText(
                  txt: ' Tola Quantity : ${widget.tolaQuantity}',
                  txtclr: AppColors.secondryColor),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: MyText(
                  txt: 'Grams Quantity : ${widget.gramsQuantity}',
                  txtclr: AppColors.secondryColor),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: MyText(
                  txt: 'Rati Quantity : ${widget.ratiQuantity}',
                  txtclr: AppColors.secondryColor),
            ),
            MyText(
                txt: 'Tola Price : ${widget.goldPrice}',
                txtclr: AppColors.secondryColor),
            MyText(
              txt: 'Tola Price:${widget.goldPrice}',
              // txtclr: AppColors.secondryColor
            )
          ],
        ),
      ),
    );
  }
}
