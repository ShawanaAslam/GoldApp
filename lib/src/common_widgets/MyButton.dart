

import 'package:flutter/material.dart';



class MyButton extends StatelessWidget {
  double h;
  double w;
  String txt;
  double font;
  FontWeight fntwt;
  Color clr;
  Color bacclr;
  VoidCallback ontap;

   MyButton({super.key,this.fntwt=FontWeight.w800,this.font=20,required this.txt,
   required this.w,required this.h,required this.bacclr,required this.clr,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: clr,
            borderRadius: BorderRadius.circular(5)
        ),
        height: h,
        width: w,

        child: Center(child: Text(txt,style: TextStyle(
            color: bacclr,fontSize: font,fontWeight: fntwt),)),
      ),
    );
  }
}
