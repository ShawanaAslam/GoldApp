

import 'package:goldapp/src/common_widgets/MyButton.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';
import '../../../utills/linker.dart';

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
                    OnBoardingPageWidget(text: 'Simplify Gold Pricing',text1: 'Quickly calculate the total cost of gold with ease.\nEnter the price, quantity, and get instant results!', image: Images.img),
                    OnBoardingPageWidget(text: 'Offline or Online?',text1: 'Your Choice Offline for quick access.Online to track your history.It’s all about what works best for you.', image: Images.scndPage),
                    OnBoardingPageWidget(text:'Start Your Journey Today',text1: 'Your trusted companion for gold pricing.Accurate, reliable, and easy to use.', image: Images.thirdPage)
                  ],
                ),
              ),
             ///TODO:- button--- for next and get started
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10,right: 20,left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => obj.currentpage <= 1
                            ? MyButton(txt: 'Next',
                            w: double.infinity, h: 50.h,
                            icon: Icons.arrow_forward,
                            bacclr: AppColors.secondryColor, clr: AppColors.primryColor,
                            ontap:(){
                              obj.pageCotroller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            })
                            : MyButton(txt: 'Get Started',
                            w: double.infinity, h: 50.h,
                            bacclr: AppColors.secondryColor, clr: AppColors.primryColor,
                            ontap:(){
                              Get.to(() => SelectionView());
                            })

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
