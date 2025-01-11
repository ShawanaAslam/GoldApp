

import 'package:url_launcher/url_launcher.dart';

import '../../../Constants/images.dart';
import '../../../../../../GroceryApp/lib/src/Utills/linker.dart';
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
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: MyText(
          txt: 'About Developer',
          font: 22,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  txt: 'Shawana Aslam\n'
                      '     Flutter Developer\n'
                      '\n'
                      'About Me:\n'
                      'I am a passionate mobile app developer \nspecializing in Flutter. I enjoy transforming ideas into functional, user-friendly mobile applications. With experience in using Firebase as a database, I focus on delivering innovative solutions tailored to user needs. My goal is to grow continuously and contribute to impactful projects.\n'
                      '\n'
                      'Skills:\n'
                      'Flutter App Development\n'
                      'Firebase Integration\n'
                      'Responsive UI/UX Design',
                  font: 16,
                  txtclr: AppColors.secondryColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      txt: 'Contact Me',
                      font: 18,
                      txtclr: AppColors.secondryColor,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                InkWellRow(
                    ontap: () async {
                      // Link create for whastapp
                      final whatsappUrl =
                          Uri.parse("https://wa.me/+923346985327");
                      await launchUrl(whatsappUrl);
                    },
                    path: Images.whatsapp,
                    txt: 'Contact On WhatsApp'),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: InkWellRow(
                    ontap: () async {
                      // Link create for github
                      final githubUrl =
                          Uri.parse('https://github.com/ShawanaAslam');
                      await launchUrl(githubUrl);
                    },
                    path: Images.github,
                    txt: 'GitHub Account',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: InkWellRow(
                    ontap: () async {
                      // Link create for Linkedin
                      final liknedinUrl = Uri.parse(
                          "https://www.linkedin.com/in/shawana-aslam-0628842a9/?originalSubdomain=pk");
                      await launchUrl(liknedinUrl);
                    },
                    path: Images.linkedin,
                    txt: 'Linkedin Account',
                  ),
                ),
                

                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: InkWellRow(
                    ontap: () async {
                      // Link create for Gmail

                      final EmailUrl =
                          Uri.parse("mailto:shawanaaslam412@gmail.com");

                      await launchUrl(EmailUrl);
                    },
                    path: Images.gmail,
                    txt: 'Gmail Account',
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
