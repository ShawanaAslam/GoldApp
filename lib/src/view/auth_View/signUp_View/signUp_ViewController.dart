// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// //import 'package:flutter/cupertino.dart'
// import 'package:get/get.dart';
// import 'package:get/get_navigation/src/root/root_controller.dart';
//
// //BackEnd Code Here
//
// class SignupController extends GetMaterialController {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController paswordController = TextEditingController();
//   var isloading = false.obs;
//
//   onsignup()async
//   {
//     try
//     {
//       isloading.value=true;
//     await  createAccount(emailController.text.trim(), paswordController.text.trim());
//     }
// catch(error)
//     {
//       isloading.value=false;
//     }
//     finally
//         {
//           isloading.value=false;
//         }
//   }
//
//   Future<String>createAccount(String email,String pasword)async
//   {
//    try
//     {
// await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: email, password: pasword);
//
// return "Account created successfully";
//     }
//
//     on FirebaseAuthException catch(exception)
//   {
// if(exception.code =='weak-pasword')
//   {
// return "your Pasword is weak";
//   }
// else if(exception.code=='email-already-in-use')
//   {
// return 'Email is already registered';
//   }
//   }
//     catch(error)
//     {
//       return error.toString();
//     }
//     finally
//     {
//
//     }
//   }
//
// }
//   //onSignUp()async{
//     // print('before if');
//     // if( namecontroller.text !='' &&  fathernamecontroller.text !='' && emailcontroller.text !='' && paswordcontroller.text !='' ){
//     //   setState(() {
//     //     isloading=true;
//     //   });
//     //  try {
//     //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     //         email: emailcontroller.text.trim().toString(),
//     //         password: paswordcontroller.text.trim().toString()
//     //     );
//         // For userId
//         //User? user = FirebaseAuth.instance.currentUser;
//         //String userId = user!.uid;
//         // await FirebaseFirestore.instance.collection('UserData').doc(emailcontroller.text).set({
//         //   'userName':namecontroller.text,
//         //   'fatherName':fathernamecontroller.text,
//         //   'userEmail':emailcontroller.text,
//         //   'pasword':paswordcontroller.text,
//
//
//        // });
//
//         // print('you are registered');
//         // confirmToastMessage(BuildContext, context, 'You are Registered Successfully');
//         // Navigator.pushReplacement(context,CupertinoPageRoute(builder:(context)=>SigninScreen()));
//      // }
//       //catch(error)
//       //{
//         // setState(() {
//         //   isloading=false;
//         // });
//         // errorToastMessage(BuildContext, context, error.toString());
//       //}
//       //finally
//       //{
//         // setState(() {
//         //   isloading=false;
//         // });
//         //Navigator.pop(context);
//       //}
//     //}
//     // else
//     // {
//     //  // errorToastMessage(BuildContext, context, 'All Fields must be filled');
//     // }
//

///----------------------------
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/colors.dart';
import '../../../utills/toast_ Notifications/toast_Notification.dart';
import '../login_View/login_View.dart';

// Backend Code
class SignupController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController(); // Fixed spelling
  TextEditingController userNameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  var isLoading = false.obs; // Fixed capitalization

  // Function for signup
  void onSignup(BuildContext context) async {
   if(passwordController.text!=confirmController.text)
   {
     Get.snackbar(
       backgroundColor: AppColors.secondryColor,
         'Error', "Pasword must be same",colorText: AppColors.primryColor);
   }
   else
     {
       try {
         print('------------------------------3');
         // jis variable ki data type TextEditingController na to us ky st (.value) use krty hn
         isLoading.value = true;
         String? result = await createAccount(
           //userNameController.text.trim(),fatherNameController.text.trim()
             emailController.text.trim(),
             passwordController.text.trim());
         // error occured during signup
         // addData();
         // if (result != null)
         if (result == 'You are registered successfully') {
           addData();
           // Handle success (like navigating to another screen or showing a message)
           confirmToastMessage(context, result!);
           Get.to(() => LoginView());
         }
         else
         {
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
         emailController.clear();
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
     // addData();

      //

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
    }
    catch (error) {
      // Handling other exceptions
      print('Error:$error');
      print('-----------------------5');
      return 'Error occurred: $error';
    }
   }

  Future<void>addData()async{
    try
        {
          //TODO app
          String docId=DateTime.now().microsecondsSinceEpoch.toString();

          await FirebaseFirestore.instance.collection('UserData').doc(docId).set({
            'name': userNameController.text,
           // 'fathername':fatherNameController.text,
            'docId':docId,
            'email':emailController.text,
          });
        }
       catch (e)
       {
         // exception for firebase authentications
         //CRUD
         // home work: exceptions for data inserting in firebase firestore
         print('Error:$e');
       }
  }
}
