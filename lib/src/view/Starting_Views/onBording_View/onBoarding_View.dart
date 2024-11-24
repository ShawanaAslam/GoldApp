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
                    OnBoardingPage(text: 'Abc', image: 'assets/bars.png'),
                    OnBoardingPage(text: 'def', image: 'assets/gold.png'),
                    OnBoardingPage(text: 'ghi', image: 'assets/goldstack.png')
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18),
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
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 40,
                                  width: 300,
                                  child: Center(
                                      child: Text(
                                    'Next',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  )),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  Get.to(() => SelectionView());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 40,
                                  width: 300,
                                  child: Center(
                                      child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                        color: Colors.black,
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
