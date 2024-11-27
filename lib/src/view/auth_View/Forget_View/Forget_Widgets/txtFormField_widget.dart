import 'package:flutter/material.dart';

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
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,color: Colors.amber,
            ),
            fillColor: clr,
            filled: true,
            labelText: lbltxt,
            labelStyle: TextStyle(color: Colors.amber),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
