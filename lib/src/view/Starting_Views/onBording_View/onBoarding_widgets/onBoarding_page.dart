

import 'package:flutter/cupertino.dart';

import '../../../../Constants/colors.dart';
import '../../../../utills/linker.dart';


class OnBoardingPageWidget extends StatelessWidget {
  String text;
  String text1;
  String image;
  bool isLastpage;

  OnBoardingPageWidget(
      {super.key,
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

TextButton(onPressed: (){
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => SelectionView()));

}, child: MyText(txt: 'Skip',
  txtclr: AppColors.secondryColor,font: 20,))

        ],),
        Expanded(
          flex: 60,
          child:   Container(
            margin: EdgeInsets.all(90),
            child:
              Image.asset(
              image,
              height: 40,

              // width: 400,
                      ),
            ),
          ),
        Expanded(
            flex: 40,
            child:   Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30), )
            ,color:AppColors.secondryColor,
          ),
          height: 330.h,
          width: double.infinity,
          child: Center(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60,),
                Text(text,style: GoogleFonts.roboto(fontSize: 25,fontWeight: FontWeight.w800),),
                SizedBox(height: 10,),
                Text(text1,style: GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w800)),

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


