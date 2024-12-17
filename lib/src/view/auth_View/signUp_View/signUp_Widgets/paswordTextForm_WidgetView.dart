// PaswordTextFormFeild with Getx

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
        padding: EdgeInsets.only(right: 30, left: 30),
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
                !RegExp(r'^(?=.[A-Za-z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%*?&]{8,}$')
                    .hasMatch(value)) {
              return 'Password must contain letters, numbers, and special characters';
            }

            if (widget.hnttxt == 'Confirm Password' &&
                value != obj.confirmController.text) {
              return 'Passwords do not match';
            }

            return null;
          },
          obscureText: // widget.hnttxt=='Enter Pasword'?
          obj.isChecked.value, //:obj.confirmChecked.value,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.amber,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    if (widget.hnttxt == 'Enter Pasword') {
                      obj.onPressed();
                    } else {
                      obj.confirmChecked();
                    }
                  },
                  icon: obj.isChecked.value || obj.confirmChecked.value
                      ? Icon(
                    Icons.remove_red_eye,
                    color: Colors.amber,
                  )
                      : Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.amber,
                  )),
              fillColor: Colors.black,
              filled: true,
              hintText: widget.hnttxt,
              errorStyle: TextStyle(color: AppColors.secondryColor),
              hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.circular(10), // Border when focused
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
    );
  }
}

//////-----------------------------------------------------------------

// PaswordTextFormFeild withOut Getx
<<<<<<< HEAD
=======
// class PaswordTextformfield extends StatefulWidget {
//   TextEditingController controller;
//  // TextEditingController? confirmController;
//   String hnttxt;
//   Color clr;
//   Widget? prefixicn;
//
//   PaswordTextformfield({super.key,
//     //required this.confirmController,
//     required this.controller,required this.hnttxt,
//     this.clr=Colors.white,this.prefixicn});
//
//   @override
//   State<PaswordTextformfield> createState() => _PaswordTextformfieldState();
// }
//
// class _PaswordTextformfieldState extends State<PaswordTextformfield> {
//   bool secure=true;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Padding(
//         padding:  EdgeInsets.only(left: 30,right: 30),
//         child: TextFormField(
//           style: TextStyle(color: Colors.white),
//           cursorColor: Colors.amber,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please ${widget.hnttxt}';
//             }
//             // if(hnttxt =='User name' && !RegExp(r'^[a-zA-z]').hasMatch(value))
//             // {
//             //   return 'Username must start with a letter';
//             // }
//             // if (hnttxt == 'Email' && !RegExp(r'^[\w-\.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,}$').hasMatch(value)) {
//             //   return 'Please enter a valid email address';
//             // }
//             // if(hnttxt =='Enter Email' && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4$}').hasMatch(value))
//             // {
//             //   return 'Please enter a valid email address';
//             // }
//             if (widget.hnttxt == 'Enter Pasword' && value.length < 8) {
//               return 'Pasword must be at least 8 characters long';
//             }
//             if (widget.hnttxt == 'Enter Pasword' &&
//                 !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
//                     .hasMatch(value)) {
//               return 'Password must contain letters, numbers, \nand special characters';
//             }
//
//             if (widget.hnttxt == 'Confirm Pasword' &&
//                 value != widget.controller.text) {
//               return 'Passwords do not match';
//             }
//
//             return null;
//           },
//           obscureText: secure,
//           obscuringCharacter: '*',
//           controller: widget.controller,
//           decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock,color: AppColors.secondryColor,),
//               suffixIcon: IconButton(onPressed: (){
//                 if(secure==false){
//                   setState((){
//                     secure=true;
//                   });
//                 }
//                 else if(secure==true){
//                   setState(() {
//                     secure=false;
//                   });
//                 }
//               },icon: secure?Icon(Icons.remove_red_eye,color: AppColors.secondryColor,)
//                   :Icon(Icons.remove_red_eye_outlined,color: AppColors.secondryColor,),),
//               fillColor: AppColors.primryColor,
//               filled: true,
//               hintText:widget.hnttxt,
//               errorStyle: TextStyle(color: AppColors.secondryColor),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: Colors.amber, ),
//               ),
//               hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.amber, ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.amber, ),
//                 borderRadius: BorderRadius.circular(10),// Border when focused
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.amber, ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white),
//                 borderRadius: BorderRadius.circular(10),
//               )
//           ),
//         ),
//       );
//   }
// }

//----------------------------------------------------------
>>>>>>> 62d31dd5e0a9fec4c71c7c990f64d2ac552a4e27

class PaswordTextformfield extends StatefulWidget {
  TextEditingController controller;
  // TextEditingController? confirmController;
  String hnttxt;
  Color clr;
  Widget? prefixicn;

  PaswordTextformfield(
      {super.key,
        //required this.confirmController,
        required this.controller,
        required this.hnttxt,
        this.clr = Colors.white,
        this.prefixicn});

  @override
  State<PaswordTextformfield> createState() => _PaswordTextformfieldState();
}

class _PaswordTextformfieldState extends State<PaswordTextformfield> {
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.amber,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please ${widget.hnttxt}';
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
          if (widget.hnttxt == 'Enter Pasword' &&
              !RegExp(r'^(?=.[A-Za-z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%*?&]{8,}$')
                  .hasMatch(value)) {
            return 'Password must contain letters, numbers, \nand special characters';
          }

          if (widget.hnttxt == 'Confirm Pasword' &&
              value != widget.controller.text) {
            return 'Passwords do not match';
          }

          return null;
        },
        obscureText: secure,
        obscuringCharacter: '*',
        controller: widget.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: AppColors.secondryColor,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                if (secure == false) {
                  setState(() {
                    secure = true;
                  });
                } else if (secure == true) {
                  setState(() {
                    secure = false;
                  });
                }
              },
              icon: secure
                  ? Icon(
                Icons.remove_red_eye,
                color: AppColors.secondryColor,
              )
                  : Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.secondryColor,
              ),
            ),
            fillColor: AppColors.primryColor,
            filled: true,
            hintText: widget.hnttxt,
            errorStyle: TextStyle(color: AppColors.secondryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.amber,
              ),
            ),
            hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
              ),
              borderRadius: BorderRadius.circular(10), // Border when focused
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.amber,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}

//----------------------------------------------------------
//import 'package:flutter/material.dart';

// class PaswordTextformfield extends StatefulWidget {
//   final TextEditingController controller;
//   final String hnttxt;
//   final Color clr;
//   final Widget? prefixicn;

//   PaswordTextformfield({
//     super.key,
//     required this.controller,
//     required this.hnttxt,
//     this.clr = Colors.white,
//     this.prefixicn,
//   });

//   @override
//   State<PaswordTextformfield> createState() => _PaswordTextformfieldState();
// }

// class _PaswordTextformfieldState extends State<PaswordTextformfield> {
//   bool secure = true;

//   // Reusable password validation RegExp
//   final RegExp passwordRegExp =
//   RegExp(r'^(?=.[A-Za-z])(?=.\d)(?=.[@\$!%?&])[A-Za-z\d@\$!%*?&]{8,}\$');

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 30, right: 30),
//       child: TextFormField(
//         style: const TextStyle(color: Colors.white),
//         cursorColor: Colors.amber,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter your ${widget.hnttxt}';
//           }
//           if (!passwordRegExp.hasMatch(value)) {
//             return 'Password must be at least 8 characters,\ncontain letters, numbers, and special characters.';
//           }
//           return null;
//         },
//         obscureText: secure,
//         obscuringCharacter: '*',
//         controller: widget.controller,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.lock,
//             color: Colors.amber,
//           ),
//           suffixIcon: IconButton(
//             onPressed: () {
//               setState(() {
//                 secure = !secure;
//               });
//             },
//             icon: Icon(
//               secure ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
//               color: Colors.amber,
//             ),
//           ),
//           fillColor: Colors.black,
//           filled: true,
//           hintText: widget.hnttxt,
//           errorStyle: const TextStyle(color: Colors.red),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(
//               color: Colors.amber,
//             ),
//           ),
//           hintStyle: const TextStyle(
//             color: Colors.amber,
//             fontSize: 14,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: Colors.amber,
//             ),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: Colors.amber,
//             ),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: Colors.red,
//             ),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: Colors.white,
//             ),
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }
<<<<<<< HEAD
// }
=======
// }

>>>>>>> 62d31dd5e0a9fec4c71c7c990f64d2ac552a4e27
