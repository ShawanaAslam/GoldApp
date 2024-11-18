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

  OnBoardingPage({super.key,
    //required this.ontap,
    //required this.text1,
    required this.text,required this.image,this.isLastpage=false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image,),
         // CircleAvatar(radius:100,backgroundImage: (AssetImage(image)),),
          SizedBox(height: 10,),
          Text(text,style: GoogleFonts.roboto(color: Colors.amber),),

    //   InkWell(
    //   onTap: ontap,
    //   child: Container(
    //     decoration: BoxDecoration(
    //         color: Colors.amber,
    //         borderRadius: BorderRadius.circular(5)
    //     ),
    //     height: 40,
    //     width: 180,
    //
    //     child: Center(child: Text(text1,style: TextStyle(
    //         color: Colors.black,fontSize: 20,fontWeight: FontWeight.w800),)),
    //   ),
    // );


          isLastpage?
              ElevatedButton(onPressed: (){}, child: Text('last page')):Container(),

        ],

      ),
    );
  }
}
