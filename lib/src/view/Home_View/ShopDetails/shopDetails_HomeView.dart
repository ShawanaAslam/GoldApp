import 'package:goldapp/src/view/Home_View/ShopDetails/shopDetails_Controller.dart';

import '../../../Constants/images.dart';
import '../../../common_widgets/simpleTextForm_widget.dart';
import '../../../utills/linker.dart';

class ShopDetailsHomeview extends StatefulWidget {
  String shpName;
  String shpEmail;
  String shopAddress;
  String Mblno1;
  String Mblno2;
  String lndline;
  ShopDetailsHomeview({super.key,
  required this.shpName, required this.shpEmail, required this.shopAddress, required this.Mblno1,
    required this.Mblno2,
  required this.lndline

  });

  @override
  State<ShopDetailsHomeview> createState() => _ShopDetailsHomeviewState();
}

class _ShopDetailsHomeviewState extends State<ShopDetailsHomeview> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    updateInfoController updateInfo = Get.put(updateInfoController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: MyText(
          txt: 'Update Shop Information',
          font: 20,
        ),
        centerTitle: true,
        actions: [
          // Icon(Icons.clear)
        ],
      ),
      backgroundColor: AppColors.primryColor,
      body: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              SimpleTextFormField(
                  prefixicn: Padding(
                    padding: const EdgeInsets.only(left: 11, right: 11),
                    child: Image.asset(
                      Images.shop,
                      //height:0,
                      width: 10,
                      color: Colors.amber,
                    ),
                  ),
                  controller: updateInfo.shopnameController,
                  hnttxt: "Shop Name"),
              SizedBox(
                height: 10,
              ),
              SimpleTextFormField(
                  prefixicn: Icon(
                    Icons.email,
                    color: Colors.amber,
                  ),
                  controller: updateInfo.shopemailController,
                  hnttxt: "Shop Email"),
              SizedBox(
                height: 10,
              ),
              SimpleTextFormField(
                  prefixicn: Icon(
                    Icons.location_on_rounded,
                    color: Colors.amber,
                  ),
                  controller: updateInfo.shopaddressController,
                  hnttxt: "Shop Address"),
              SizedBox(
                height: 10,
              ),
              SimpleTextFormField(
                  keyboardtype: TextInputType.number,
                  prefixicn: Icon(
                    Icons.call,
                    color: Colors.amber,
                  ),
                  controller: updateInfo.mblno1Controller,
                  hnttxt: "Mobile No 1"),
              SizedBox(
                height: 10,
              ),
              SimpleTextFormField(
                  keyboardtype: TextInputType.number,
                  prefixicn: Icon(
                    Icons.call,
                    color: Colors.amber,
                  ),
                  controller: updateInfo.mblno2Controller,
                  hnttxt: "Mobile No 2"),
              SizedBox(
                height: 10,
              ),
              SimpleTextFormField(
                  keyboardtype: TextInputType.number,
                  prefixicn: Icon(
                    Icons.call_end,
                    color: Colors.amber,
                  ),
                  controller: updateInfo.ptclController,
                  hnttxt: "Landline No"),
              SizedBox(
                height: 40,
              ),
              updateInfo.isLoading.value?
              AppLoading():
              MyButton(
                  ontap: (){
                    print('-----------------------1');
                    // difference b/w validation and exception
                    // validator--> handle in front end(design side)
                    //exceptions--> handle in backend (in data base)


                    if (key.currentState!.validate()) // true --- false
                      //(_formKey.currentState!.validate())
                        {
                      updateInfo.onUpdateInfo(context);
                    }
                  },
                  txt: 'Update Info', w: 270.w, h: 50.h, bacclr: AppColors.primryColor,
                  clr: AppColors.secondryColor)

            ],
          ),
        ),
      ),
    );
  }
}
