import 'package:flutter/material.dart';

class MyTextFormConVali extends StatelessWidget {
  TextEditingController controller;
  String hinttxt;
  String lbltxt;

  MyTextFormConVali(
      {super.key,
      required this.hinttxt,
      required this.controller,
      required this.lbltxt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextFormField(
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
            hintStyle: TextStyle(color: Colors.amber),
            labelText: lbltxt,
            labelStyle: TextStyle(color: Colors.amber),

          enabledBorder: OutlineInputBorder(

            borderSide: BorderSide(color: Colors.amber, ), // Default border
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber, ), // Border when focused
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber, ), // Border on error
          ),

        ),
      ),
    );
  }
}
