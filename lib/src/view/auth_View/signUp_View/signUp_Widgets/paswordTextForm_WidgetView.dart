import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Constants/colors.dart';
import 'paswordTextForm_WidgetController.dart';

class PaswordTextForm extends StatefulWidget {
   TextEditingController controller;
  String hnttxt;
  Color clr;
  Widget? prefixicn;

  PaswordTextForm({
    super.key,
    required this.controller,
    required this.hnttxt,
    this.clr = Colors.white,
    this.prefixicn,
  });

  @override
  State<PaswordTextForm> createState() => _PaswordTextFormState();
}

class _PaswordTextFormState extends State<PaswordTextForm> {
  @override
  Widget build(BuildContext context) {
    TextPasswordController obj = Get.put(TextPasswordController());

    return Obx(
          () => Padding(
        padding:  EdgeInsets.only(right: 30, left: 30),
        child: TextFormField(
          controller: widget.controller,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.amber,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your ${widget.hnttxt}';
            }
            // if(hnttxt =='User name' && !RegExp(r'^[a-zA-z]').hasMatch(value))
            // {
            //   return 'Username must start with a letter';
            // }
            // if (hnttxt == 'Email' && !RegExp(r'^[\w-\.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,}$').hasMatch(value)) {
            //   return 'Please enter a valid email address';
            // }
            // if(hnttxt =='Enter Email' && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4$}').hasMatch(value))
            // {
            //   return 'Please enter a valid email address';
            // }
            if (widget.hnttxt == 'Enter Pasword' && value.length < 8) {
              return 'Pasword must be at least 8 characters long';
            }
            if (widget.hnttxt == 'Enter Password' &&
                !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                    .hasMatch(value)) {
              return 'Password must contain letters, numbers, and special characters';
            }
           //  if (
           // // value == null
           //    widget.hnttxt =='Confirm Pasword'  || value.isEmpty) {
           //    return 'Please confirm your password';
           //  }
           //  if (value != obj.controller.text) {
           //    return 'Passwords do not match';
           //  }
            if (widget.hnttxt == 'Confirm Password' &&
                value != obj.confirmController.text) {
              return 'Passwords do not match';
            }

            return null;
          },
          obscureText:// widget.hnttxt=='Enter Pasword'?
          obj.isChecked.value,//:obj.confirmChecked.value,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock,color: Colors.amber,),
              suffixIcon: IconButton(
                  onPressed: () {
                    if(widget.hnttxt=='Enter Pasword'){
                      obj.onPressed();
                    }
                    else
                      {
                        obj.confirmChecked();
                      }

                  },
                  icon: obj.isChecked.value || obj.confirmChecked.value
                      ? Icon(Icons.remove_red_eye,color: Colors.amber,)
                      : Icon(Icons.remove_red_eye_outlined,color: Colors.amber,)),
              fillColor: Colors.black,
              filled: true,
              hintText: widget.hnttxt,
              errorStyle: TextStyle(color: AppColors.secondryColor),
              hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber, ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber, ),
                borderRadius: BorderRadius.circular(10),// Border when focused
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber, ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              )
          ),
        ),
      ),
    );
  }
}


//////-----------------------------------------------------------------
///
//  Padding(
//   padding: EdgeInsets.only(left: 30, right: 30),
//   child:
//   TextFormField(
//     controller: widget.controller,
//     // true / false
//     validator: (value) {
//       if (value == null || value.isEmpty) {
//         return 'Please enter your ${widget.hnttxt}';
//       }
//       // if(hnttxt =='User name' && !RegExp(r'^[a-zA-z]').hasMatch(value))
//       // {
//       //   return 'Username must start with a letter';
//       // }
//       // if (hnttxt == 'Email' && !RegExp(r'^[\w-\.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,}$').hasMatch(value)) {
//       //   return 'Please enter a valid email address';
//       // }
//       // if(hnttxt =='Enter Email' && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4$}').hasMatch(value))
//       // {
//       //   return 'Please enter a valid email address';
//       // }
//       if (widget.hnttxt == 'Enter Pasword' && value.length < 8) {
//         return 'Pasword must be at least 8 characters long';
//       }
//       if (widget.hnttxt == 'Enter Password' &&
//           !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
//               .hasMatch(value)) {
//         return 'Password must contain letters, numbers, and special characters';
//       }

//       // if(hnttxt == 'Enter Pasword' && !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value))
//       // {
//       //   return 'Pasword must contain letters,numbers, and special characters';
//       // }
//       return null;
//     },
//     obscureText: secure,
//     obscuringCharacter: '*',
//     decoration: InputDecoration(
//         prefixIcon: widget.prefixicn ?? null,
//         suffixIcon: IconButton(
//           onPressed: () {
//             if (secure == false) {
//               setState(() {
//                 secure = true;
//               });
//             } else if (secure == true) {
//               setState(() {
//                 secure = false;
//               });
//             }
//           },
//           icon: secure
//               ? Icon(Icons.remove_red_eye_outlined)
//               : Icon(Icons.remove_red_eye),
//         ),
//         fillColor: widget.clr,
//         filled: true,
//         hintText: widget.hnttxt,
//         hintStyle: TextStyle(color: Colors.black, fontSize: 14),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//         )),
//   ),
// );


