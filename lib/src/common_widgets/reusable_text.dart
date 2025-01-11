


import '../utills/linker.dart';

class MyText extends StatelessWidget {
  String txt;
  Color txtclr;
  Color? decclr;
  double font;
  TextDecoration? decoration;
   MyText({super.key,required this.txt, this.txtclr
   =Colors.black,this.decclr,this.font=16,this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(txt,
      style: TextStyle(
        color: txtclr,
        fontSize: font,
        fontWeight: FontWeight.w800,
        decoration: decoration??null,
        decorationColor: decclr??null,
        //    decorationStyle: TextDecorationStyle.double,
        decorationThickness: 2,
      ),
    );
  }
}
