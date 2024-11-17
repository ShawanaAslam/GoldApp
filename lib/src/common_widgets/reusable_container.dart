

import 'package:flutter/material.dart';



class MyContainer extends StatelessWidget {
  double h;
  double w;
  String txt;
  double font;
  FontWeight fntwt;
  Color clr;
  Color bacclr;

   MyContainer({super.key,this.fntwt=FontWeight.w800,this.font=20,required this.txt,
   required this.w,required this.h,required this.bacclr,required this.clr});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.circular(5)
      ),
      height: h,
      width: w,

      child: Center(child: Text(txt,style: TextStyle(
          color: bacclr,fontSize: font,fontWeight: fntwt),)),
    );
  }
}
