import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/common_widgets/MyButton.dart';
import 'package:goldapp/src/view/selection_View/selection_View.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Constants/colors.dart';

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
    return Container(
      color: AppColors.primryColor,
      child: Column(children: [
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

          MyButton(
            txt: 'Skip',
            font: 16,
            w: 70.w,
            h: 40.h,
            bacclr: Colors.black,
            clr: Colors.amber,
            ontap: ()  {
Get.to(()=>SelectionView());
            },
          ),
        ],),
        Expanded(
          flex: 60,
          child:   Container(
            margin: EdgeInsets.all(90),
            child: Image.asset(
            image,
            height: 40,
            // width: 400,
                    ),
          ),),
        Expanded(
            flex: 40,
            child:   Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30), )
            ,color:AppColors.secondryColor,
          ),
          height: 330,
          width: double.infinity,
          child: Center(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80,),
                Text(text,style: GoogleFonts.roboto(fontSize: 25,fontWeight: FontWeight.w800),),
                SizedBox(height: 10,),
                Text(text1,style: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w800))
              ],
            ),
          )),
        )),
    //  SizedBox(height: 100,),


     //   SizedBox(height: 80,),


      ],),
    );
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
