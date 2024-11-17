import 'package:flutter/material.dart';

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
      body:OrientationBuilder(
        builder: (context,orientation){
          return GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details){


            },

          )
        },

      ) ,

    );
  }
}
