
import '../../../utills/linker.dart';
import '../../../utills/toast_ Notifications/toast_Notification.dart';

class ShopInfoController extends GetxController {
  TextEditingController shopnameController = TextEditingController();
  TextEditingController shopemailController = TextEditingController();
  TextEditingController shopaddressController = TextEditingController();
  TextEditingController mblno1Controller = TextEditingController();
  TextEditingController mblno2Controller = TextEditingController();
  TextEditingController ptclController = TextEditingController();
  var isLoading = false.obs;

  var shopname = ''.obs;
  var shopemail = ''.obs;
  var shopaddress = ''.obs;
  var mblno1 = ''.obs;
  var mblno2 = ''.obs;
  var ptcl = ''.obs;

  // is function cy shop ka email or shop name fetch ho rha hai
  /* or is function cy print walay page py data fetch ho ky aa rha hai
  shop information wala */
  void fetchShopInfo() async {
    // try {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user != null) // false
    {
      print('===================1');
      // shopname.value = await user!.email ?? '';
      String userid = user.uid ?? '';
      //shopemail.value = user.email ?? '';//logedin user email
      if (shopemail != null) {
        print('===================2');
        final userdocs = await FirebaseFirestore.instance
            .collection('ShopInfo')
            .where('docId', isEqualTo: userid)
            .get();
        if (userdocs.docs.isNotEmpty) {
          print('===================3');
          //setState(() {
          shopname.value = userdocs.docs.first['shopName'];
          print('${shopname.value = userdocs.docs.first['shopName']}');
          shopemail.value = userdocs.docs.first['shopEmail'];
          shopaddress.value = userdocs.docs.first['shopAddress'];
          mblno1.value = userdocs.docs.first['mblNo1'];
          mblno2.value = userdocs.docs.first['mblNo2'];
          ptcl.value = userdocs.docs.first['ptclNo'];

          //  });
        }
      }
    }
    // } catch (error) {
    //   print('Error:$error');
    //   Get.snackbar('Error', 'Error:$error');
    // }
    //}
  }

  Future<void> onSaveInfo(BuildContext context) async {
    try {
      isLoading.value = true;
      await shopInfo();
      Get.to(() => GoldShop());
      confirmToastMessage(context,
          //'Data Enter Successfully');
          'Your information has been saved');
    } catch (error) {
      isLoading.value = false;
      // Handle error
      errorToastMessage(context, error.toString());
    } finally {
      isLoading.value = false;
      shopnameController.clear();
      shopaddressController.clear();
      shopemailController.clear();
      mblno1Controller.clear();
      mblno2Controller.clear();
      ptclController.clear();
    }
  }

  Future<void> shopInfo() async {
    try {
      //--> docid--> current user logedin
      // String docId = DateTime.now().microsecondsSinceEpoch.toString();
      String docId = await FirebaseAuth.instance.currentUser!
          .uid; //DateTime.now().microsecondsSinceEpoch.toString();
      print('=========================================');

      await FirebaseFirestore.instance.collection('ShopInfo').doc(docId).set({
        'docId': docId,
        'shopName': shopnameController.text,
        'shopEmail': shopemailController.text,
        'shopAddress': shopaddressController.text,
        'mblNo1': mblno1Controller.text,
        'mblNo2': mblno2Controller.text,
        'ptclNo': ptclController.text
      });
    } catch (e) {
      print('Error:$e');
    }
  }
}
