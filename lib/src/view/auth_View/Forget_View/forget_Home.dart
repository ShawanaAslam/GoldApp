import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/colors.dart';
import '../login_View/login_View.dart';
import 'Forget_Widgets/inkwell_Widget.dart';



class ForgetHome extends StatelessWidget {
  ForgetHome({super.key});
  // bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Email send successfuly, please check your email',
            style: GoogleFonts.roboto(color: Colors.amber),),
            SizedBox(
              height: 20,
            ),
            //isloading
            //?
            //  CircularProgressIndicator(
            //     color: Colors.white,
            //   )
            // :
            InkwellWidget(
                clr: Colors.amber,
                txt: 'Login',
                ontap: () {
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => LoginView()));
                })
          ],
        ),
      ),
    );
  }
}
