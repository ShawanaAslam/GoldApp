import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../Constants/colors.dart';

class DatePickerTextformfield extends StatefulWidget {
  TextEditingController controller;
  String hnttxt;
  Color clr;

  DatePickerTextformfield({
    super.key,
    required this.controller,
    required this.hnttxt,
    this.clr = Colors.white,
  });

  @override
  State<DatePickerTextformfield> createState() =>
      _DatePickerTextformfieldState();
}

class _DatePickerTextformfieldState extends State<DatePickerTextformfield> {
  DateTime? selectedDate;

  Future<void> selectdate(BuildContext context) async {
    print("function starting");
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2028),
        initialDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = selectedDate.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: AppColors.secondryColor,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                selectdate(context);
              },
              icon: Icon(
                Icons.calendar_month_rounded,
                color: AppColors.secondryColor,
              ),
            ),
            fillColor: widget.clr,
            filled: true,
            hintText: widget.hnttxt,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            errorStyle: TextStyle(color: AppColors.secondryColor),
            hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primryColor,
              ),
              borderRadius: BorderRadius.circular(10), // Border when focused
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primryColor),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
