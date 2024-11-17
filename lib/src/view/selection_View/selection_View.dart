import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/view/Home_Views/gold-HomeView.dart';

import '../../common_widgets/MyButton.dart';
import '../../common_widgets/reusable_text.dart';

class SelectionView extends StatefulWidget {
  const SelectionView({super.key});

  @override
  State<SelectionView> createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: MyText(txt:'Selection Screen',font: 22,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          //SizedBox(height: 40,),
          MyButton(ontap: (){
            Get.to(()=>GoldShop());
          },  txt:'Continue without Login',h: 40,w:300 ,
            bacclr: Colors.black,clr: Colors.amber,font:20,fntwt: FontWeight.w600, ),
          SizedBox(height: 20,),

          MyButton(ontap: (){
            Get.to(()=>GoldShop());
          },  txt:'Continue with Login',h: 40,w:200 ,
            bacclr: Colors.black,clr: Colors.amber,font: 20,fntwt: FontWeight.w600),

        ],),
      ),
    );
  }
}
