

import 'package:flutter/cupertino.dart';

import '../../../../../GroceryApp/lib/src/Utills/linker.dart';

class SelectionView extends StatefulWidget {
  const SelectionView({super.key});

  @override
  State<SelectionView> createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(onPressed: (){
          Get.back();
        },icon:Icon(Icons.arrow_back_ios),),
        title: MyText(
          txt: 'Selection Screen',
          font: 22,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


          Container(
          height: 60.h,
          width: 300.w,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5)),
          child: Center(child: Text('Continue...',style:GoogleFonts.roboto(
            fontWeight: FontWeight.w800,fontSize: 20
          ),)),
        ),

            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

children: [

                  MyButton(
                      ontap: () {
                        Navigator.pushReplacement(
                            context, CupertinoPageRoute(builder: (context) => LoginView()));

                      },
                      txt: 'with Login',
                      h: 150.h,
                      w: 180.w,
                      bacclr: Colors.black,
                      clr: Colors.amber,
                      font: 20,
                      fntwt: FontWeight.w600),
                  SizedBox(
                    width: 20,
                  ),

            MyButton(

              ontap: () {
                Navigator.pushReplacement(
                    context, CupertinoPageRoute(builder: (context) => GoldShop()));

              },
              txt: 'without Login',
              h: 150.h,
              w: 180.w,
              bacclr: Colors.black,
              clr: Colors.amber,
              font: 20,
              fntwt: FontWeight.w600,
            ),

      ])
          ],
        ),
      ),
    );
  }
}
