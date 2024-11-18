import 'package:flutter/material.dart';
import 'package:goldapp/src/view/Starting_Views/onBording_View/onBoarding_widgets/onBoarding_page.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

   PageController _pageCotroller= PageController();
  int currentpage=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:OrientationBuilder(
        builder: (context,orientation){
          return GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details){

              if(details.primaryVelocity!>0)
                {
                  _pageCotroller.previousPage(duration:(Duration(milliseconds: 500)),
                      curve: Curves.ease);
                }

              else if(details.primaryVelocity!<0)
              {
              _pageCotroller.nextPage(duration:(Duration(milliseconds: 500)),
              curve: Curves.linear);
              }

            },
            child: PageView(
              controller: _pageCotroller,
              onPageChanged: (int page)
              {
              setState(() {
                currentpage=page;
              });

              },
              children: [
                OnBoardingPage(text: 'Abc', image: 'assets/bars.png'),
                OnBoardingPage(text: 'def', image: 'assets/gold.png'),
                OnBoardingPage(text: 'ghi', image: 'assets/goldstack.png')

              ],
            ),

          );

        },

      ) ,
      floatingActionButton: currentpage<3? FloatingActionButton(
        onPressed: (){
          _pageCotroller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
        },child: Icon(Icons.navigate_next_outlined),
      ):null

    );
  }
}
