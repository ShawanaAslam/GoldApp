

import 'package:flutter/cupertino.dart';

import '../../../common_widgets/simpleTextForm_widget.dart';
import '../../../utills/linker.dart';
import '../Forget_View/forget_View.dart';
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
             // key: key,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
InkWell(onTap: (){
  Get.to(()=>GoldShop());
},
    child: Padding(
      padding: EdgeInsets.only(left: 120),
      child:  MyText(
        txt: 'Continue Without Login',
        decoration: TextDecoration.underline,
        decclr: Colors.amber,
        txtclr: Colors.amber,
        font: 20,
      ),
    )),
                    SizedBox(
                      height: 200,
                    ),
                    SimpleTextFormField(
                        prefixicn: Icon(
                          Icons.email,
                          color: Colors.amber,
                        ),
                        controller: loginController.emailController,
                        hnttxt: "Enter Email"),
                    SizedBox(
                      height: 20,
                    ),

                    PaswordTextformfield(
                        controller: loginController.passwordController,
                        hnttxt:"Enter Pasword" ),

                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                               context,
                               CupertinoPageRoute(
                              builder: (context) => ForgetPasword()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: MyText(txt:
                                'Forget Pasword?',
                               font: 15,
                               txtclr: AppColors.whiteColor,

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
                          :   MyButton(
                          ontap: (){
                            print('-----------------------1');
                            // difference b/w validation and exception
                            // validator--> handle in front end(design side)
                            //exceptions--> handle in backend (in data base)


                          // if (key.currentState!.validate()) // true --- false
                              //(_formKey.currentState!.validate())
                                {
                              loginController.onLogin(context);
                            }
                          },
                          txt: 'Log in', w: 270.w, h: 50.h, bacclr: AppColors.primryColor,
                          clr: AppColors.secondryColor);
                    }),
                    SizedBox(
                      height: 5,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      MyText(txt:
                        "Don't have an account ?",
                        txtclr: AppColors.secondryColor,
                        font: 15,

                      ),
                      SizedBox(width: 10),
                      InkWell(
                          onTap: () {
                            Get.to(() => SignupView());
                          },
                          child: MyText(txt:
                            'Sign Up',
                            txtclr: AppColors.whiteColor,
                            font: 15,

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
