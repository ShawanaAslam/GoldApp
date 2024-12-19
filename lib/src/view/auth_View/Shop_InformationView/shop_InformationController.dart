
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

  void onSaveInfo(BuildContext context) {
    try {
      isLoading.value = true;
      shopInfo();
      Get.to(() => GoldShop());
      confirmToastMessage(context, 'You are registered successfully');
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
