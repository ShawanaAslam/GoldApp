


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/MyButton.dart';
import '../../common_widgets/reusable_mytxtformcon.dart';
import '../../common_widgets/reusable_text.dart';
import 'gold HomeViewController.dart';


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
        actions: [
          IconButton(onPressed: (){
            // navigate to history screen

          }, icon: Icon(Icons.history_toggle_off,size: 30,),)
        ],
        backgroundColor: Colors.amber,
        title: MyText(txt: 'Gold App',font: 25,),
        centerTitle: true,
      ),
      drawer: Drawer(
        // flow chart
        // flow diagram
        // sketching of an application
        // in drawer header
        // picture
        // user name
        // user email

        //--------> flow chart---
        //1st: home
        // 2nd history screen
        // 3rd about app screen
        // 4th about developers screen---> developer intro , image, contacts: whatsapp , email
        // 5rd signout
        // 6th: login
      ),
      body: SingleChildScrollView(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: MyTextFormCon(
                  controller:obj.n1 ,hinttxt:"Enter gold Price" ,lbltxt:"Gold Price",),

            ),

            SizedBox(height: 50,),

            MyText(txt:'Enter Gold Quantity',decoration:TextDecoration.underline,decclr: Colors.amber ,txtclr: Colors.amber,font: 18,),

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


             MyButton(
                  ontap:(){
                    obj.onfuction();
                  },
                  txt: 'Enter', w: 180, h: 40, bacclr: Colors.black, clr: Colors.amber,
                  font: 20,fntwt: FontWeight.w800),


          ],
        ),
      ),

    );
  }
}