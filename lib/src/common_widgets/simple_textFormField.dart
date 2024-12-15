// import 'package:flutter/material.dart';
// import 'package:goldapp/src/Constants/colors.dart';
//
// class SimpleText extends StatelessWidget {
//   TextEditingController controller;
//   String hnttxt;
//   Color clr;
//   Widget? prefixicn;
//   Widget? pstfixicn;
//
//   SimpleText(
//       {super.key,
//       required this.controller,
//       required this.hnttxt,
//       this.clr = Colors.white,
//       this.prefixicn,
//       this.pstfixicn});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 30, right: 30),
//       child: TextFormField(
//         controller: controller,
//         style: TextStyle(color: Colors.white),
//         cursorColor: Colors.amber,
//         // true / false
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter your $hnttxt';
//           }
//           if (hnttxt == 'User name' && !RegExp(r'^[a-zA-z]').hasMatch(value)) {
//             return 'Username must start with a letter';
//           }
//           if (hnttxt == 'Email' &&
//               !RegExp(r'^[\w-\.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,}$')
//                   .hasMatch(value)) {
//             return 'Please enter a valid email address';
//           }
//           // if(hnttxt =='Enter Email' && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4$}').hasMatch(value))
//           // {
//           //   return 'Please enter a valid email address';
//           // }
//           // if(hnttxt == 'Enter Pasword' && value.length < 8)
//           // {
//           //   return 'Pasword must be at least 8 characters long';
//           // }
//           // if (hnttxt == 'Enter Password' && !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
//           //   return 'Password must contain letters, numbers, and special characters';
//           // }
//
//           // if(hnttxt == 'Enter Pasword' && !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value))
//           // {
//           //   return 'Pasword must contain letters,numbers, and special characters';
//           // }
//           return null;
//         },
//         decoration: InputDecoration(
//             prefixIcon: prefixicn ?? null,
//             suffixIcon: pstfixicn ?? null,
//             fillColor: Colors.black,
//             filled: true,
//             hintText: hnttxt,
//             errorStyle: TextStyle(color: AppColors.secondryColor),
//             hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.amber,
//               ),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.amber,
//               ),
//               borderRadius: BorderRadius.circular(10), // Border when focused
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.amber,
//               ),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.white),
//               borderRadius: BorderRadius.circular(10),
//             )),
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// // class SimpleText extends StatelessWidget {
// //   TextEditingController controller;
// //   String lbltxt;
// //   Color clr;
// //
// //   SimpleText({super.key,required this.controller,required this.lbltxt,
// //     this.clr=Colors.white,});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //       Padding(
// //         padding:  EdgeInsets.only(left: 30,right: 30),
// //         child: TextFormField(
// //           controller: controller,
// //           decoration: InputDecoration(
// //               fillColor: clr,
// //               filled: true,
// //               labelText:lbltxt,
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(10),
// //               )
// //           ),
// //         ),
// //       );
// //   }
// // }
