import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/utills/Loading_Effect/app_Loading.dart';

import 'Forget_Widgets/inkwell_Widget.dart';
import 'Forget_Widgets/txtFormField_widget.dart';
import 'forget_Controller.dart';



class ForgetPasword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ForgetController obj = Get.put(ForgetController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EmailTextformfield(clr: Colors.black,
              controller: obj.paswordController,
              lbltxt: 'Enter Email For Password Reset',

            ),
            SizedBox(height: 40),
            Obx(() {
              return obj.isloading.value
                  ? AppLoading()
                  : InkwellWidget(
                txt: 'Reset Password',
                clr: Colors.amber,
                ontap: () {
                  obj.forget(context);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
