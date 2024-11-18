import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:goldapp/src/view/Starting_Views/onBording_View/onBoarding_Controller.dart';
import 'package:goldapp/src/view/Starting_Views/onBording_View/onBoarding_widgets/onBoarding_page.dart';

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
            return GestureDetector(
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
                  // setState(() {
                  //   currentpage=page;
                  // });
                },
                children: [
                  OnBoardingPage(text: 'Abc', image: 'assets/bars.png'),
                  OnBoardingPage(text: 'def', image: 'assets/gold.png'),
                  OnBoardingPage(text: 'ghi', image: 'assets/goldstack.png')
                ],
              ),
            );
          },
        ),
        floatingActionButton:
            //Container()

            obj.currentpage < 3
                ? FloatingActionButton(
                    onPressed: () {
                      obj.pageCotroller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    child: Icon(Icons.navigate_next_outlined),
                  )
                : null);
  }
}
