import '../../../utills/linker.dart';
import '../../../utills/toast_ Notifications/toast_Notification.dart';

class updateInfoController extends GetxController {
  TextEditingController shopnameController = TextEditingController();
  TextEditingController shopemailController = TextEditingController();
  TextEditingController shopaddressController = TextEditingController();
  TextEditingController mblno1Controller = TextEditingController();
  TextEditingController mblno2Controller = TextEditingController();
  TextEditingController ptclController = TextEditingController();
  var isLoading = false.obs;
  String userId = '';
  String userEmail = '';

  HomeFetchDataController ref = Get.put(HomeFetchDataController());


//   @override
//   void onInit() {
//     super.onInit();
//     fetchShopDetails(); // Fetch data on controller initialization
//   }
//
//   Future<void> fetchShopDetails() async {
//     try {
//
//       String docId = FirebaseAuth.instance.currentUser!.uid;
//
//       DocumentSnapshot snapshot = await FirebaseFirestore.instance
//           .collection('ShopInfo')
//           .doc(docId)
//           .get();
// {
//      if (snapshot.exists) {
//         Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//         shopnameController.text = data['shopName'] ?? '';
//         shopemailController.text = data['shopEmail'] ?? '';
//         shopaddressController.text = data['shopAddress'] ?? '';
//         mblno1Controller.text = data['mblNo1'] ?? '';
//         mblno2Controller.text = data['mblNo2'] ?? '';
//         ptclController.text = data['ptclNo'] ?? '';
//       }
//     //   else {
//     //     errorToastMessage(Get.context!, 'No data found for this user.');
//     //   }
//     }
//     } catch (error) {
//       errorToastMessage(Get.context!, error.toString());
//     }
//
//   }

  Future<void> onUpdateInfo(BuildContext context) async {
    try {
      String docId = await FirebaseAuth.instance.currentUser!.uid;
      isLoading.value = true;

      UpdateData(context, docId);
      Get.back();
      confirmToastMessage(context, 'Your information has been saved');
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


  Future<void> UpdateData(BuildContext context, String id) async {
    User? user = FirebaseAuth.instance.currentUser;
    userId = user!.uid ?? '';
    userEmail = user!.email ?? '';

    try {
      await FirebaseFirestore.instance.collection('ShopInfo').doc(id).update({
        //'docId': docId,
        'shopName': shopnameController.text,
        'shopEmail': shopemailController.text,
        'shopAddress': shopaddressController.text,
        'mblNo1': mblno1Controller.text,
        'mblNo2': mblno2Controller.text,
        'ptclNo': ptclController.text
      });
      confirmToastMessage(context, 'Data Updated Successfully');
    } catch (error) {
      // Handle error
      errorToastMessage(context, error.toString());
    } finally {}
  }
}
