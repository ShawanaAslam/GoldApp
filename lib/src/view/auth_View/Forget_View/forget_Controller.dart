//   @override
//   void onClose() {
//     // in memory , refresh it
//     // data clean in RAM memory
//     // .clear() function just empty the textform field
//     // release form RAM memory
//     emailController.dispose();
//     super.onClose();
//   }
// }
//-------------------------------------------------------------------

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../utills/toast_ Notifications/toast_Notification.dart';
import 'forget_Home.dart';

class ForgetController extends GetxController {
  TextEditingController paswordController = TextEditingController();

  var isloading = false.obs;

  forget(context) async {
    isloading.value = true;

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: paswordController.text.trim());

      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => ForgetHome()));

      confirmToastMessage(context, 'You are Successfully changed Pasword');
    } catch (error) {
      isloading.value = false;
      // Handle error
      errorToastMessage(context, error.toString());
    } finally {
      isloading.value = false;
    }
  }
}
