import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goldapp/src/common_widgets/MyButton.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatelessWidget {
  String text;
  // String text1;
  String image;
  //VoidCallback ontap;
  bool isLastpage;

  OnBoardingPage(
      {super.key,
      //required this.ontap,
      //required this.text1,
      required this.text,
      required this.image,
      this.isLastpage = false});

  @override
  Widget build(BuildContext context) {
    return Column(children: [

    ],);
    //   Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Image.asset(
    //         image,
    //         height: 130,
    //       ),
    //       // CircleAvatar(radius:100,backgroundImage: (AssetImage(image)),),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Text(
    //         text,
    //         style: GoogleFonts.roboto(color: Colors.amber),
    //       ),
    //
    //       isLastpage
    //           ? ElevatedButton(onPressed: () {}, child: Text('last page'))
    //           : Container(),
    //     ],
    //   ),
    // );
  }
}

// Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Image.asset(
// image,
// height: 130,
// ),
// // CircleAvatar(radius:100,backgroundImage: (AssetImage(image)),),
// SizedBox(
// height: 10,
// ),
// Text(
// text,
// style: GoogleFonts.roboto(color: Colors.amber),
// ),
//
// isLastpage
// ? ElevatedButton(onPressed: () {}, child: Text('last page'))
//     : Container(),
// ],
// ),
// );
