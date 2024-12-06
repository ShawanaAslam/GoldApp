import 'package:flutter/material.dart';

import '../../../../Constants/colors.dart';

class EmailTextformfield extends StatelessWidget {
  TextEditingController controller;
  String lbltxt;
  Color clr;
  IconData icon;

  EmailTextformfield({
    super.key,
    required this.controller,
    required this.lbltxt,
    this.clr = Colors.white,
    this.icon = Icons.email,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        cursorColor: AppColors.secondryColor,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your ${lbltxt}';
      }

    },
        decoration:InputDecoration(
        prefixIcon: Icon(
        icon, color: Colors.amber,
      ),
      fillColor: clr,
      filled: true,
      labelText: lbltxt,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      errorStyle: TextStyle(color: AppColors.secondryColor),
      hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber,),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber,),
        borderRadius: BorderRadius.circular(10), // Border when focused
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber,),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),


    )
      ),
    );
  }
}
