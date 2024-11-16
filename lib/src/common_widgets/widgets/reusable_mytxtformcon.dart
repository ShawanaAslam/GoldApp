

import 'package:flutter/material.dart';

class MyTextFormCon extends StatelessWidget {

  TextEditingController controller;
  String hinttxt;
  String lbltxt;

  MyTextFormCon({super.key,required this .hinttxt,required this.controller
  , required this.lbltxt});



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: hinttxt,
            hintStyle: TextStyle(color:Colors.amber),
            labelText: lbltxt,
            labelStyle: TextStyle(color: Colors.amber),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )
        ),
      ),
    );
  }
}
