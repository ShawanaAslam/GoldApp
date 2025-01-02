

import 'package:intl/intl.dart';
import '../../../../utills/linker.dart';

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
  String formattedDate = '';

  Future<void> selectdate(BuildContext context) async {
    print("function starting");
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000),
        initialDate: DateTime.now(),

    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          primaryColor: Colors.amber, // Header background color
          colorScheme: ColorScheme.dark(
            primary: Colors.white, // Selected date color
            surface: Colors.amber, // Dialog background color
            onSurface: Colors.black, // Text color
          ),
          dialogBackgroundColor: Colors.black, // Dialog background color
        ),
        child: child!,
      );
    }
    );


    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);

        //DateFormat('yyyy-MM-dd').format(selectedDate);
        widget.controller.text = formattedDate; //selectedDate.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: widget.controller,
        cursorColor: AppColors.secondryColor,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please ${widget.hnttxt}';
    }
    return null;
    },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            //prefixIcon:Icon(Icons.cal,color:AppColors.secondryColor,) ,
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
                color: AppColors.secondryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.secondryColor,
              ),
              borderRadius: BorderRadius.circular(10), // Border when focused
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.secondryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.secondryColor),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
