

import '../../../../utills/linker.dart';

class InkwellWidget extends StatelessWidget {
  VoidCallback ontap;
  String txt;
  Color clr;
  InkwellWidget(
      {super.key,
        required this.txt,
        required this.ontap,
        this.clr = Colors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
          height: 40,
          width: 250,
          decoration: BoxDecoration(
              color: clr, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              txt,
              style: TextStyle()//(color: Colors.amber),
            ),
          ),
        ));
  }
}
