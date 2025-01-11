import '../../../common_widgets/simpleTextForm_widget.dart';

import '../../../utills/linker.dart';
import 'signUp_ViewController.dart';
import 'signUp_Widgets/paswordTextForm_WidgetView.dart';

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
            child: Center(
              child: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    SimpleTextFormField(
                        prefixicn: Icon(Icons.person, color: Colors.amber),
                        controller: signupController.userNameController,
                        hnttxt: "Enter User Name"),

                    SizedBox(
                      height: 20,
                    ),
                    SimpleTextFormField(
                        prefixicn: Icon(
                          Icons.email,
                          color: Colors.amber,
                        ),
                        controller: signupController.userEmailController,
                        hnttxt: "Enter User Email"),
                    SizedBox(
                      height: 20,
                    ),
                    PaswordTextformfield(

                        keyboardtype: TextInputType.number,
                        controller: signupController.passwordController,
                        hnttxt: "Enter Pasword"),
                    SizedBox(
                      height: 20,
                    ),
                    PaswordTextformfield(
                      keyboardtype: TextInputType.number,
                        controller: signupController.confirmController,
                        hnttxt: "Confirm Pasword"),

                    SizedBox(
                      height: 50,
                    ),

                    Obx(() {
                      return signupController.isLoading.value
                          ? AppLoading()
                          :
                      MyButton(
                          ontap: (){
                            print('-----------------------1');
                            // difference b/w validation and exception
                            // validator--> handle in front end(design side)
                            //exceptions--> handle in backend (in data base)
                            //signupController.onSignup(context);

                            if (key.currentState!
                                 .validate()) // true --- false
                            // //(_formKey.currentState!.validate())
                             {
                            //   print('--------------------------2');
                               signupController.onSignup(context);
                           }
                          },
                          txt: 'Sign Up', w: 270.w, h: 50.h, bacclr: AppColors.primryColor,
                          clr: AppColors.secondryColor) ;

                    }),
                    SizedBox(
                      height: 5,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      MyText(txt:
                        'Already have an account ?',
                       font: 15,
                       txtclr: AppColors.secondryColor,
                      ),
                      SizedBox(width: 10),
                      InkWell(
                          onTap: () {
                            Get.to(() => LoginView());
                          },
                          child: MyText(txt:
                            'Login',font: 15,
                          txtclr: AppColors.whiteColor,

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
