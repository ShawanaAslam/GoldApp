
import '../../../Constants/images.dart';
import '../../../common_widgets/simpleTextForm_widget.dart';
import '../../../utills/linker.dart';

class ShopInformationview extends StatefulWidget {
  const ShopInformationview({super.key});

  @override
  State<ShopInformationview> createState() => _ShopInformationviewState();
}

class _ShopInformationviewState extends State<ShopInformationview> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    ShopInfoController  shopInfo =Get.put(ShopInfoController());

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
          txt: 'Shop Information',
          font: 22,
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
          child: Column(children: [

            SizedBox(height: 40,),
            SimpleTextFormField(
                prefixicn: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Image.asset(
                    Images.shop,
                    //height:0,
                    width: 10,
                    color: Colors.amber,
                  ),
                ),
                controller: shopInfo.shopnameController,
                hnttxt: "Shop Name"),
            SizedBox(height: 10,),
            SimpleTextFormField(
                prefixicn: Icon(
                  Icons.email,
                  color: Colors.amber,
                ),
                controller: shopInfo.shopemailController,
                hnttxt: "Shop Email"),
            SizedBox(height: 10,),
            SimpleTextFormField(
                prefixicn: Icon(
                  Icons.location_on_rounded,
                  color: Colors.amber,
                ),
                controller: shopInfo.shopaddressController,
                hnttxt: "Shop Address"),
            SizedBox(height: 10,),
            SimpleTextFormField(
                prefixicn: Icon(
                  Icons.call,
                  color: Colors.amber,
                ),
                controller: shopInfo.mblno1Controller,
                hnttxt: "Mobile No 1"),
            SizedBox(height: 10,),
            SimpleTextFormField(
                prefixicn: Icon(
                  Icons.call,
                  color: Colors.amber,
                ),
                controller: shopInfo.mblno2Controller,
                hnttxt: "Mobile No 2"),
            SizedBox(height: 10,),
            SimpleTextFormField(
                prefixicn: Icon(
                  Icons.call_end,
                  color: Colors.amber,
                ),
                controller: shopInfo.ptclController,
                hnttxt: "Landline No"),

            SizedBox(height: 40,),
          InkWell(
            onTap: () {
              // difference b/w validation and exception
              // validator--> handle in front end(design side)
              //exceptions--> handle in backend (in data base)
          
              if (key.currentState!
                  .validate()) // true --- false
                //(_formKey.currentState!.validate())
                  {
               shopInfo.onSaveInfo(context);
              }
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber),
                height: 40,
                width: 250,
                child: Center(
                    child: Text(
                      'Save Info',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ))),
          )
          
          ],),
        ),
      ),
    );
  }
}
