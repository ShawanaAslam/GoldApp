
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/reusable_text.dart';

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
        title: MyText(txt: 'About Developer',
          font: 22,),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: ()async{
                // Link create for whastapp
                final whatsappUrl=Uri.parse("https://wa.me/+923346985327");
                await launchUrl(whatsappUrl);
              },
              child:  MyText(txt:'Contact On WhatsApp',txtclr: Colors.amber,),
            ),

            SizedBox(height: 20,),
            InkWell(
              onTap: ()async{
                // Link create for github

                final githubUrl=Uri.parse('https://github.com/dashboard');

                await launchUrl(githubUrl);
              },
              child:  MyText(txt: 'GitHub Account',txtclr: Colors.amber,),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: ()async{
                // Link create for Linkedin

                final liknedinUrl=Uri.parse("www.linkedin.com/in/shawana-aslam-0628842a9");
                await launchUrl(liknedinUrl);
              },
              child:  MyText(txt: 'Linkedin Account',txtclr: Colors.amber,),
            ),

            SizedBox(height: 20,),
            InkWell(
              onTap: ()async{
                // Link create for Linkedin

                final EmailUrl=Uri.parse("ShawanaAslam412@gmail.com");
                await launchUrl(EmailUrl);
              },
              child:  MyText(txt: 'Gmail Account',txtclr: Colors.amber,),
            ),

          ],
        ),
      ),
    );
  }
}
