
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  String txt;
  double? fntsz;
  Color ?clr;
   TextWidget({super.key,required this.txt,this.fntsz,this.clr});

  @override
  Widget build(BuildContext context) {
    return  Text(txt,style:GoogleFonts.roboto(
      color: clr
    ),);;
  }
}
