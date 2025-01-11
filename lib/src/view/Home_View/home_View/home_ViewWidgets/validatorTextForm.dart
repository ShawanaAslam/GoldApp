
import '../../../../utills/linker.dart';

class MyTextFormConVali extends StatelessWidget {
  TextEditingController controller;
  String hinttxt;
  String lbltxt;
  //TextInputType keyboardtype;

  MyTextFormConVali(
      {super.key,
      required this.hinttxt,
    //    this.keyboardtype = TextInputType.text,
      required this.controller,
      required this.lbltxt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Plz $hinttxt';
          }
          return null;
        },
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.amber,
        decoration: InputDecoration(
            hintText: hinttxt,
            hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
            labelText: lbltxt,
            labelStyle: TextStyle(color: Colors.amber),
            errorStyle: TextStyle(color: AppColors.secondryColor),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
              ), // Default border
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
              ), // Border when focused
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
              ), // Border on error
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              // borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
