import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goldapp/src/Constants/colors.dart';
import 'package:goldapp/src/view/auth_View/Shop_InformationView/shop_InformationController.dart';

import '../../../common_widgets/reusable_text.dart';
import '../../../common_widgets/simpleTextForm_widget.dart';

class ShopInformationview extends StatefulWidget {
  const ShopInformationview({super.key});

  @override
  State<ShopInformationview> createState() => _ShopInformationviewState();
}

class _ShopInformationviewState extends State<ShopInformationview> {
  @override
  Widget build(BuildContext context) {

    ShopInfoController  obj =Get.put(ShopInfoController());

    return Scaffold(
      backgroundColor: AppColors.primryColor,
      body: Column(children: [
        MyText(
          txt: 'Shop Information View',
          decoration: TextDecoration.underline,
          decclr: Colors.amber,
          txtclr: Colors.amber,
          font: 20,
        ),
        SizedBox(height: 20,),
        SimpleTextFormField(
            prefixicn: Icon(
              Icons.shopping_cart,
              color: Colors.amber,
            ),
            controller: obj.shopnameController,
            hnttxt: "Shop Name"),
      ],),
    );
  }
}
