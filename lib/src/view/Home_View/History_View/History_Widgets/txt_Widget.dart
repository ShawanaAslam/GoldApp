


import '../../../../utills/linker.dart';

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
