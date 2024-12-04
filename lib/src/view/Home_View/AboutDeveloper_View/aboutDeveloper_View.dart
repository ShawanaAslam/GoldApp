
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Constants/images.dart';
import '../../../common_widgets/reusable_text.dart';
import 'AboutDeveloper_Widget/Inkwell_Row.dart';

class AboutDeveloper extends StatefulWidget {

  const AboutDeveloper({super.key});

  @override
  State<AboutDeveloper> createState() => _AboutDeveloperState();
}

class _AboutDeveloperState extends State<AboutDeveloper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(onPressed: (){
          Get.back();
        },icon:  Icon(Icons.arrow_back_ios)),
        title: MyText(txt: 'About Developer',
          font: 22,),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWellRow(
              ontap: ()async{
                // Link create for whastapp
                final whatsappUrl=Uri.parse("https://wa.me/+923346985327");
                await launchUrl(whatsappUrl);
              },
        path:Images.whatsapp,
        txt:'Contact On WhatsApp'),

            //   child:  Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Image.asset(
            //         Images.whatsapp,
            //         width: 35,
            //         height: 35,
            //       ),
            //       SizedBox(width: 10,),
            //       MyText(
            //         txt: 'Contact On WhatsApp',
            //         // decoration: TextDecoration.underline,
            //         // decclr: Colors.amber,
            //         txtclr: Colors.amber,
            //         font: 18,
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(height: 20,),

            InkWellRow(
              ontap: ()async{
                // Link create for github
                final githubUrl=Uri.parse('https://github.com/dashboard');
                await launchUrl(githubUrl);
              },
              path: Images.github,
              txt: 'GitHub Account',
            ),

            SizedBox(height: 20,),

            InkWellRow(
              ontap: ()async{
                // Link create for Linkedin
                final liknedinUrl=Uri.parse("www.linkedin.com/in/shawana-aslam-0628842a9");
                await launchUrl(liknedinUrl);
              },
              path: Images.linkedin,
              txt:  'Linkedin Account',
            ),

            SizedBox(height: 20,),

            InkWellRow(
              ontap: ()async{
                // Link create for Linkedin
                final EmailUrl=Uri.parse("ShawanaAslam412@gmail.com");
                await launchUrl(EmailUrl);
              },
              path:Images.gmail,
              txt:'Gmail Account' ,
            ),

          ],
        ),
      ),
    );
  }
}
