import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goldapp/src/common_widgets/MyButton.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatelessWidget {
  String text;
  String text1;
  String image;
  //VoidCallback ontap;
  bool isLastpage;

  OnBoardingPage(
      {super.key,
      //required this.ontap,
      required this.text1,
      required this.text,
      required this.image,
      this.isLastpage = false});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
    SizedBox(height: 100,),
        Image.asset(
            image,
            height: 130,
         // width: 400,
          ),

      SizedBox(height: 80,),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30), )
              ,color: Colors.amber,
        ),
        height: 330,
        width: double.infinity,
child: Center(child: Column(
 // mainAxisAlignment: MainAxisAlignment.center,
  //crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    SizedBox(height: 80,),
    Text(text,style: GoogleFonts.roboto(fontSize: 25,fontWeight: FontWeight.w800),),
    SizedBox(height: 20,),
    Text(text1,style: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w800))
  ],
)),
      )

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
