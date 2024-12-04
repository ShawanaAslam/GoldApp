import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goldapp/src/view/Starting_Views/onBording_View/onBoarding_Controller.dart';
import 'package:goldapp/src/view/Starting_Views/onBording_View/onBoarding_widgets/onBoarding_page.dart';
import 'package:goldapp/src/view/auth_View/signUp_View/signUp_View.dart';
import 'package:goldapp/src/view/selection_View/selection_View.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';

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
      backgroundColor: AppColors.primryColor,
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
                    OnBoardingPage(text: 'Simplify Gold Pricing',text1: 'Quickly calculate the total cost of gold with ease.\nEnter the price, quantity, and get instant results!', image: Images.frstPage),
                    OnBoardingPage(text: 'Offline or Online?',text1: 'Your Choice Offline for quick access.Online to track your history.It’s all about what works best for you.', image: Images.scndPage),
                    OnBoardingPage(text:'Start Your Journey Today',text1: 'Your trusted companion for gold pricing.Accurate, reliable, and easy to use.', image: Images.thirdPage)
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
                                      color: AppColors.primryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 40,
                                  width: double.infinity,
                                  child: Center(
                                      child: Row(

                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,

                                        children: [
                                          Text(
                                                                              'Next',
                                                                              style: TextStyle(
                                            color: AppColors.secondryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800),
                                                                            ),

                                          SizedBox(width: 15,),
                                          Icon(Icons.arrow_forward,color: AppColors.secondryColor,),

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
                                      color: AppColors.primryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 40,
                                  width: double.infinity,
                                  child: Center(
                                      child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                        color: AppColors.secondryColor,
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
