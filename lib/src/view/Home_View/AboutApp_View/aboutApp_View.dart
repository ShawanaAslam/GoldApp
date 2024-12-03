import 'package:flutter/material.dart';

import '../../../common_widgets/reusable_text.dart';

class AboutAppView extends StatefulWidget {
  const AboutAppView({super.key});

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,

        title: MyText(
          txt: 'Welcome To GoldApp!',
          font: 22,
        ),
        centerTitle: true,
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(bottom: 18,right: 20,left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          MyText(txtclr: Colors.amber,
          txt: 'This app is designed to simplify your gold price calculations. Whether you have internet access or not, AikGold empowers you to find the total gold price instantly.\n'
              '\n'
        'Key Features:\n '
              '\n'
              'Use the app freely without internet to calculate gold prices. Enter the gold price and quantity, then press the button to see the final price on your screen.\n If you wish to save your calculations for future reference, simply register. Your data will then be saved automatically.\n'
              '\n '
        'Developer Note:\n'
              '\n'
              'This app is built with simplicity and ease of use in mind. We value your feedback and look forward to improving the app further. Thank you for choosing AikGold!')

        ],),
      ),
    );
  }
}
