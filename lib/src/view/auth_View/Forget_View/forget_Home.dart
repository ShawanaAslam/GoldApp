
import 'package:flutter/cupertino.dart';

import '../../../utills/linker.dart';
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
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: MyText(txt: 'Email send successfuly, please check your Email',
              txtclr: AppColors.secondryColor,
              ),
            ),
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
