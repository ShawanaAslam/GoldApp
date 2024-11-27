import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/utills/Loading_Effect/app_Loading.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common_widgets/simpleTextForm_widget.dart';
import '../signUp_View/signUp_View.dart';
import '../signUp_View/signUp_Widgets/paswordTextForm_WidgetView.dart';

import 'login_ViewController.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Form(
              key: key,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                    ),
                    SimpleText(
                        prefixicn: Icon(
                          Icons.email,
                          color: Colors.amber,
                        ),
                        controller: loginController.emailController,
                        hnttxt: "Enter Email"),
                    SizedBox(
                      height: 20,
                    ),
                    PaswordTextForm(
                        prefixicn: Icon(
                          Icons.lock,
                        ),
                        controller: loginController.passwordController,
                        hnttxt: "Enter Pasword"),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              // Navigator.push(
                              //  context,
                              //  CupertinoPageRoute(
                              // builder: (context) => ForgetPasword()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                'Forget Pasword?',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Obx(() {
                      return loginController.isLoading.value
                          ? AppLoading()
                          : InkWell(
                              onTap: () {
                                // difference b/w validation and exception
                                // validator--> handle in front end(design side)
                                //exceptions--> handle in backend (in data base)

                                if (key.currentState!
                                    .validate()) // true --- false
                                //(_formKey.currentState!.validate())
                                {
                                  loginController.onLogin(context);
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
                                    'Log in',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                            );
                    }),
                    SizedBox(
                      height: 5,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Don't have an account ?",
                        style: GoogleFonts.roboto(color: Colors.amber),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                          onTap: () {
                            Get.to(() => SignupView());
                          },
                          child: Text(
                            'Sign Up',
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
