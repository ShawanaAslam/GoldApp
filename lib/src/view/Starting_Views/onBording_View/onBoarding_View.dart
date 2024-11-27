import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goldapp/src/view/Starting_Views/onBording_View/onBoarding_Controller.dart';
import 'package:goldapp/src/view/Starting_Views/onBording_View/onBoarding_widgets/onBoarding_page.dart';
import 'package:goldapp/src/view/auth_View/signUp_View/signUp_View.dart';
import 'package:goldapp/src/view/selection_View/selection_View.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    OnBoardingController obj = Get.put(OnBoardingController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  if (details.primaryVelocity! > 0) {
                    obj.pageCotroller.previousPage(
                        duration: (Duration(milliseconds: 500)),
                        curve: Curves.ease);
                  } else if (details.primaryVelocity! < 0) {
                    obj.pageCotroller.nextPage(
                        duration: (Duration(milliseconds: 500)),
                        curve: Curves.linear);
                  }
                },
                child: PageView(
                  controller: obj.pageCotroller,
                  onPageChanged: (int page) {
                    //  setState(() {
                    obj.currentpage.value = page;
                    //});
                  },
                  children: [
                    OnBoardingPage(text: 'Simplify Gold Pricing',text1: 'Quickly calculate the total cost of gold with ease.\nEnter the price, quantity, and get instant results!', image: 'assets/bars.png'),
                    OnBoardingPage(text: 'Offline or Online?',text1: 'Your Choice Offline for quick access.\nOnline to track your history. \nIt’s all about what works best for you.', image: 'assets/gold.png'),
                    OnBoardingPage(text:'Start Your Journey Today',text1: 'Your trusted companion for gold pricing.\nAccurate, reliable, and easy to use.', image: 'assets/goldstack.png')
                  ],
                ),
              ),
             ///TODO:- button--- for next and get started
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18,right: 20,left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => obj.currentpage <= 1
                            ? InkWell(
                                onTap: () {
                                  obj.pageCotroller.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 40,
                                  width: double.infinity,
                                  child: Center(
                                      child: Row(
<<<<<<< HEAD
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
=======
>>>>>>> 8b631ed4f847dd29c8c2c38c5e0790b5a8f0af6d
                                        children: [
                                          Text(
                                                                              'Next',
                                                                              style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800),
                                                                            ),
<<<<<<< HEAD
                                          SizedBox(width: 15,),
                                          Icon(Icons.arrow_forward,color: Colors.amber,),
=======
>>>>>>> 8b631ed4f847dd29c8c2c38c5e0790b5a8f0af6d
                                        ],
                                      )),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  Get.to(() => SelectionView());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 40,
                                  width: 300,
                                  child: Center(
                                      child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  )),
                                ),
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      //  floatingActionButton:
      //Container()

      // obj.currentpage < 3
      //     ? FloatingActionButton(
      //         onPressed: () {
      //           obj.pageCotroller.nextPage(
      //               duration: Duration(milliseconds: 500),
      //               curve: Curves.linear);
      //         },
      //         child: Icon(Icons.navigate_next_outlined),
      //       )
      //     : null
    );
  }
}
