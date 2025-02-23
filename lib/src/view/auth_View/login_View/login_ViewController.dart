
import 'package:flutter/cupertino.dart';


import '../../../utills/linker.dart';
import '../../../utills/toast_ Notifications/toast_Notification.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  var isLoading = false.obs;

  // Method to handle login
  void onLogin(BuildContext context) async {
    try {
      isLoading.value = true; // Show loading
      String? result = await loginAccount(
        emailController.text.trim(),
        passwordController.text.trim(),
        shopNameController.text.trim(),
        fatherNameController.text.trim(),
          );
      //  if (result != null)
      if (result == 'You are successfully logged in') {
        // Show success toast
       confirmToastMessage(context, result!);


        // Navigate to BottomBar screen after login
       Navigator.pushReplacement(
           context, CupertinoPageRoute(builder: (context) => GoldShop()));

      }
      // else {
      //   // Show error toast if result is not success
      //   errorToastMessage(context, result ?? 'Login failed');
      // }
    } catch (error) {
      // In case of any error, show the error message
      errorToastMessage(context,'Error: ${error.toString()}' );

    } finally {
      isLoading.value = false; // Hide loading in both success and error cases
    }
  }

  // Method to create account and sign in
  Future<String?> loginAccount(
      String email,
      String password,
      String userName,
      String fatherName,
      ) async {
    try {
      // Sign in using FirebaseAuth
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If login is successful, clear the text controllers

      emailController.clear();
      passwordController.clear();

      return 'You are successfully logged in'; // Return success message
    } catch (error) {
      // Catch and return error message in case of failure
      return 'Error occurred: $error';
    }
  }
}
