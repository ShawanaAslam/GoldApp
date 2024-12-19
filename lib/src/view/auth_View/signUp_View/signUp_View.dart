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
                      controller: signupController.passwordController,
                      hnttxt: "Enter Pasword"),
                  SizedBox(
                    height: 20,
                  ),
                  PaswordTextformfield(
                      controller: signupController.confirmController,
                      hnttxt: "Confirm Pasword"),

                  SizedBox(
                    height: 50,
                  ),
                  // TextFormField(
                  //   style: TextStyle(color: Colors.white),
                  //   decoration: InputDecoration(
                  //       labelText: "Enter Text",
                  //       labelStyle: TextStyle(color: Colors.white),
                  //       hintText: 'Enter Text',
                  //       hintStyle: TextStyle(color: Colors.white)),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // TextFormField(
                  //   style: TextStyle(color: Colors.white),
                  //   decoration: InputDecoration(
                  //       labelText: "Enter Text",
                  //       labelStyle: TextStyle(color: Colors.white),
                  //       hintText: 'Enter Text',
                  //       hintStyle: TextStyle(color: Colors.white)),
                  // ),

                  // SizedBox(
                  //   height: 15,
                  // ),
                  // TextFormField(
                  //   style: TextStyle(color: Colors.white),
                  //   decoration: InputDecoration(
                  //       labelText: "Enter Text",
                  //       labelStyle: TextStyle(color: Colors.white),
                  //       hintText: 'Enter Text',
                  //       hintStyle: TextStyle(color: Colors.white)),
                  // ),

                  Obx(() {
                    return signupController.isLoading.value
                        ? AppLoading()
                        : InkWell(
                            onTap: () {
                              print('-----------------------1');
                              // difference b/w validation and exception
                              // validator--> handle in front end(design side)
                              //exceptions--> handle in backend (in data base)
                              signupController.onSignup(context);

                              // if (key.currentState!
                              //     .validate()) // true --- false
                              // //(_formKey.currentState!.validate())
                              // {
                              //   print('--------------------------2');
                              //   signupController.onSignup(context);
                              // }
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
            // Form(
            //   key: key, // reperesent validator implement textform field ,
            //   child:
            // ),
          )),
    );
  }
}
