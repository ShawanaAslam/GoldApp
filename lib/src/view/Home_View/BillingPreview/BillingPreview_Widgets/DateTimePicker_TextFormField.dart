

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
        initialDate: DateTime.now(),//);
    // Theme(
    //   data: ThemeData.dark().copyWith(
    //     // Calendar background color
    //     colorScheme: ColorScheme.dark(
    //       primary: Colors.amber, // Header and selection color
    //       onPrimary: Colors.black, // Text color on the header
    //       onSurface: Colors.white, // Text color on the calendar days
    //     ),
    //     dialogBackgroundColor: Colors.black, // Background color of the dialog
    //   ),
    //   child: Text(''),
    // );
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
///----------------------------------------------
// class DatePickerScreen extends StatefulWidget {
//
//   TextEditingController controller;
//   String hnttxt;
//   Color clr;
//
//   DatePickerScreen({
//     super.key,
//     required this.controller,
//     required this.hnttxt,
//     this.clr = Colors.white,
//   });
//
//   @override
//   _DatePickerScreenState createState() => _DatePickerScreenState();
// }
//
// class _DatePickerScreenState extends State<DatePickerScreen> {
//   DateTime? selectedDate;
//   String formattedDate = '';
//
//   void _openDatePicker(BuildContext context) async {
//     DateTime initialDate = selectedDate ?? DateTime.now();
//
//     Future<void> selectdate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData.dark().copyWith(
//             primaryColor: Colors.amber, // Header background color
//             colorScheme: ColorScheme.dark(
//               primary: Colors.amber, // Selected date color
//               surface: Colors.black, // Dialog background color
//               onSurface: Colors.white, // Text color
//             ),
//             dialogBackgroundColor: Colors.black, // Dialog background color
//           ),
//           child: child!,
//         );
//       },
//     );
//
//     if (pickedDate != null && pickedDate != selectedDate) {
//       setState(() {
//         selectedDate = pickedDate;
//         formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
//
//         //DateFormat('yyyy-MM-dd').format(selectedDate);
//         widget.controller.text = formattedDate;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 30, right: 30),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         controller: widget.controller,
//         cursorColor: AppColors.secondryColor,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please ${widget.hnttxt}';
//           }
//           return null;
//         },
//         style: TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           //prefixIcon:Icon(Icons.cal,color:AppColors.secondryColor,) ,
//             suffixIcon: IconButton(
//               onPressed: () {
//                 selectdate(context);
//               },
//               icon: Icon(
//                 Icons.calendar_month_rounded,
//                 color: AppColors.secondryColor,
//               ),
//             ),
//             fillColor: widget.clr,
//             filled: true,
//             hintText: widget.hnttxt,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             errorStyle: TextStyle(color: AppColors.secondryColor),
//             hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: AppColors.secondryColor,
//               ),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: AppColors.secondryColor,
//               ),
//               borderRadius: BorderRadius.circular(10), // Border when focused
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: AppColors.secondryColor,
//               ),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.secondryColor),
//               borderRadius: BorderRadius.circular(10),
//             )),
//       ),
//     );
//   }
// }


//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Date Picker'),
//         backgroundColor: Colors.amber, // AppBar background color
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               selectedDate != null
//                   ? 'Selected Date: ${selectedDate.toString().split(' ')[0]}'
//                   : 'No date selected',
//               style: TextStyle(
//                   fontSize: 18, color: Colors.amber), // Text color amber
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber, // Button background color amber
//                 foregroundColor: Colors.black, // Text color black
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               ),
//               onPressed: () => _openDatePicker(context),
//               child: Text(
//                 'Pick a Date',
//                 style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black), // Button text color black
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//----------------------------------------------

