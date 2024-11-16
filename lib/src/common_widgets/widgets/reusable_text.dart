
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  String txt;
  Color txtclr;
  Color decclr;
  double font;
   MyText({super.key,required this.txt, this.txtclr
   =Colors.black,this.decclr=Colors.amber,this.font=16});

  @override
  Widget build(BuildContext context) {
    return Text(txt,
      style: TextStyle(
        color: txtclr,
        fontSize: font,
        fontWeight: FontWeight.w800,
        decoration: TextDecoration.underline,
        decorationColor: decclr,
        //    decorationStyle: TextDecorationStyle.double,
        decorationThickness: 2,
      ),
    );
  }
}
