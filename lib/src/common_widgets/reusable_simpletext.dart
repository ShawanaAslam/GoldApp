

import '../utills/linker.dart';

class SimpleText extends StatelessWidget {
  String txt;
  double font;
  FontWeight fntwt;
  SimpleText({super.key,required this.txt,required this.font,required this.fntwt});

  @override
  Widget build(BuildContext context) {
    return Text( txt,
      style: TextStyle(
          color: Colors.black,
          fontSize: font,
          fontWeight: fntwt));
  }
}
