import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldapp/src/view/Home_Views/gold-home-view.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      body: Column(children: [
        TextButton(onPressed: (){
          Get.to(()=>GoldShop());
        }, child: Text('Continue Without login')),
        SizedBox(height: 40,),
        TextButton(onPressed: (){
          // auth screens
        }, child: Text('Continue with login')),

      ],),
    );
  }
}
