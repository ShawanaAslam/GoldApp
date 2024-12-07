import 'package:flutter/material.dart';

import '../../../../common_widgets/reusable_text.dart';
class InkWellRow extends StatelessWidget {
  VoidCallback ontap;
  String path;
  String txt;
   InkWellRow({super.key,required this.ontap,required this.path,
   required this.txt});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            path,
            width: 35,
            height: 35,
          ),
          SizedBox(width: 10,),
          MyText(
            txt: txt,
            // decoration: TextDecoration.underline,
            // decclr: Colors.amber,
            txtclr: Colors.amber,
            font: 18,
          ),

        ],
      ),
    );
  }
}
