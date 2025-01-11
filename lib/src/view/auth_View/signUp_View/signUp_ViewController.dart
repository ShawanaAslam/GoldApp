

import 'package:flutter/cupertino.dart';
import '../../../utills/linker.dart';
import '../../../utills/toast_ Notifications/toast_Notification.dart';
import '../Shop_InformationView/shop_InformationView.dart';

// Backend Code
class SignupController extends GetxController {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController passwordController =
      TextEditingController(); // Fixed spelling
  TextEditingController userNameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  var isLoading = false.obs; // Fixed capitalization
  var username = ''.obs;
  var useremail = ''.obs;

  // Function for signup
  void onSignup(BuildContext context) async {
    if (passwordController.text != confirmController.text) {
      Get.snackbar(
          backgroundColor: AppColors.secondryColor,
          'Error',
          "Pasword must be same",
          colorText: AppColors.primryColor);
    } else {
      try {
        print('------------------------------3');
        // jis variable ki data type TextEditingController na to us ky st (.value) use krty hn
        isLoading.value = true;
        username.value = userNameController.text;
        useremail.value = userEmailController.text;
        String? result = await createAccount(
            //userNameController.text.trim(),fatherNameController.text.trim()
            userEmailController.text.trim(),
            passwordController.text.trim());
        // error occured during signup

        // if (result != null)
        if (result == 'You are registered successfully') {
          addData();
          // Handle success (like navigating to another screen or showing a message)
          confirmToastMessage(context, result!);
          Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (context) => ShopInformationview()));

        } else {
          errorToastMessage(context, result!);
        }
      } catch (error) {
        isLoading.value = false;
        // Handle error
        errorToastMessage(context, error.toString());
      } finally {
        isLoading.value = false;
        print('--------------------6');
        userNameController.clear();
        confirmController.clear();
        userEmailController.clear();
        passwordController.clear();
      }
    }
  }

  // Function to create account using FirebaseAuth
// return type functions---
  Future<String?> createAccount(
    String email,
    String password,
    //String userName, String fatherName // ye bi pata krna hai or navigation ka bi
  ) async {
    try {
      print('-------------------------4');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return 'You are registered successfully'; // Success message
    } on FirebaseAuthException catch (exception) {
      // Handling FirebaseAuth exceptions
      // if (exception.code == 'weak-password')
      // {
      //   return 'Your password is too weak';
      // }
      //else
      if (exception.code == 'email-already-in-use') {
        return 'The email is already registered';
      } else {
        return 'Something went wrong: ${exception.message}';
      }
    } catch (error) {
      // Handling other exceptions
      print('Error:$error');
      print('-----------------------5');
      return 'Error occurred: $error';
    }
  }

  Future<void> addData() async {
    try {
      print("add-----------------------1");
      //TODO app
      //-->

      String docId = await FirebaseAuth.instance.currentUser!
          .uid; //DateTime.now().microsecondsSinceEpoch.toString();

      await FirebaseFirestore.instance.collection('UserData').doc(docId).set({
        'name': username.value,
        'docId': docId,
        'email': useremail.value,
      });
    } catch (e) {
      // exception for firebase authentications
      //CRUD
      // home work: exceptions for data inserting in firebase firestore
      print('Error:$e');
    }
  }
}
