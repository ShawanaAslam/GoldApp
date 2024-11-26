import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:goldapp/src/view/auth_View/signUp_View/signUp_Widgets/paswordTextForm_WidgetView.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/simpleTextForm_widget.dart';
import 'signUp_ViewController.dart';

import '../login_view/login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  //final _formKey = GlobalKey<FormState>();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Form(
              key: key, // reperesent validator implement textform field ,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: 150,
                    ),
                    SimpleText(
                        prefixicn: Icon(Icons.person, color: Colors.amber),
                        controller: signupController.userNameController,
                        hnttxt: "User Name"),
                    SizedBox(
                      height: 20,
                    ),
                    SimpleText(
                        prefixicn: Icon(Icons.person, color: Colors.amber),
                        controller: signupController.fatherNameController,
                        hnttxt: "Father Name"),
                    SizedBox(
                      height: 20,
                    ),
                    SimpleText(
                        prefixicn: Icon(
                          Icons.email,
                          color: Colors.amber,
                        ),
                        controller: signupController.emailController,
                        hnttxt: "Enter Email"),
                    SizedBox(
                      height: 20,
                    ),
                    // SimpleText(
                    //     prefixicn: Icon(Icons.email),
                    //     controller: signupController.passwordController,
                    //     hnttxt: "Enter Password"),

                    PaswordTextForm(
                        prefixicn: Icon(Icons.lock),
                        controller: signupController.passwordController,
                        hnttxt: "Enter Pasword"),
                    SizedBox(
                      height: 50,
                    ),
                    Obx(() {
                      return signupController.isLoading.value
                          ? CircularProgressIndicator()
                          : InkWell(
                              onTap: () {
                                print('-----------------------1');
                                // difference b/w validation and exception
                                // validator--> handle in front end(design side)
                                //exceptions--> handle in backend (in data base)

                                if (key.currentState!
                                    .validate()) // true --- false
                                //(_formKey.currentState!.validate())
                                {
                                  print('--------------------------2');
                                  signupController.onSignup(context);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber),
                                height: 40,
                                width: 250,
                                child: Center(
                                    child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.black),
                                )),
                              ),
                            );
                    }),
                    SizedBox(
                      height: 5,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Already have an account ?',
                        style: GoogleFonts.roboto(color: Colors.amber),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                          onTap: () {
                            Get.to(() => LoginView());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ))
                    ])
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
