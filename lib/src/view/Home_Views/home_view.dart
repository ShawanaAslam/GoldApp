


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/widgets/reusable_container.dart';
import '../../common_widgets/widgets/reusable_mytxtformcon.dart';
import '../../common_widgets/widgets/reusable_text.dart';
import 'home_ViewController.dart';


class GoldShop extends StatefulWidget {
  const GoldShop({super.key});

  @override
  State<GoldShop> createState() => _GoldShopState();
}

class _GoldShopState extends State<GoldShop> {

  // TextEditingController n1=TextEditingController();
  // TextEditingController n2=TextEditingController();
  // TextEditingController n3=TextEditingController();
  // TextEditingController n4=TextEditingController();
  // TextEditingController n5=TextEditingController();

  // double total=0;

  @override
  Widget build(BuildContext context) {

    GoldShopController obj =Get.put(GoldShopController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: MyText(txt: '"Project of Gold Shop..!"',decclr: Colors.black,font: 24,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: MyTextFormCon(
                  controller:obj.n1 ,hinttxt:"Enter gold Price" ,lbltxt:"Gold Price"),

            ),

            SizedBox(height: 50,),

            MyText(txt:'Enter Gold Quantity' ,txtclr: Colors.amber,font: 20,),

            SizedBox(height: 50,),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextFormCon(hinttxt:  "Enter Tola", controller:obj. n2, lbltxt:"Tola" ),
                  SizedBox(width: 50,),
                  MyTextFormCon(hinttxt:"Enter Grams", controller: obj.n3, lbltxt: "Grams")

                ],
              ),
            ),
            SizedBox(height: 50,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextFormCon(hinttxt:"Enter Rati", controller: obj.n4, lbltxt: "Rati"),
                  SizedBox(width: 50,),
                  MyTextFormCon(hinttxt:"Enter Points", controller: obj.n5, lbltxt: "Points"),

                ],
              ),
            ),
            SizedBox(height: 70,),

            InkWell(
              onTap:() {
                obj.onfuction();

                // if(n1.text=='')
                //   {
                //     n1.text='0';
                //   }
                // if(n2.text=='')
                // {
                //   n2.text='0';
                // }
                // if(n3.text=='')
                // {
                //   n3.text='0';
                // }
                // if(n4.text=='')
                // {
                //   n4.text='0';
                // }
                // if(n5.text=='')
                // {
                //   n5.text='0';
                // }
                //
                //  //first we find Rs of 1 gram
                //  double Rspergram=double.parse(n1.text)/12;
                //  double goldgram= Rspergram * double.parse(n3.text);
                //  //total=total + goldgram;
                //  double RsperRati=double.parse(n1.text)/96;
                //  double goldRati=RsperRati * double.parse(n4.text);
                //  //total=total + goldRati;
                //  double points=double.parse(n4.text)/12;
                //  double goldpoints=points *double.parse(n5.text);
                //
                //  total = (double.parse(n1.text) * double.parse(n2.text)) + ( goldgram + goldRati + goldpoints);
                //
                //
                // Get.defaultDialog(
                //
                //     backgroundColor: Colors.amber,
                //   title: 'Total Rs :',
                //   titleStyle: TextStyle(color: Colors.black),
                //   content: SimpleText(txt: '$total', font:20, fntwt: FontWeight.w800),
                //   actions: [
                //    InkWell(onTap:(){
                //      Get.back();
                //    },
                //      child: MyContainer(txt: 'Back', w: 70, h: 40, bacclr: Colors.amber, clr: Colors.black,font: 15,),
                //
                //    )
                //   ]
                // );
                // Future.delayed(Duration(seconds: 3),(){
                //   setState((){
                //     n1.clear();
                //     n2.clear();
                //     n3.clear();
                //     n4.clear();
                //     n5.clear();
                //   });
                //
                // });
              },
              child: MyContainer(txt: 'Enter', w: 180, h: 40, bacclr: Colors.black, clr: Colors.amber,
                  font: 20,fntwt: FontWeight.w800),

            ),
          ],
        ),
      ),

    );
  }
}