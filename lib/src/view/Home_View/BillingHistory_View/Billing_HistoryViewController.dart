import '../../../utills/linker.dart';

class BillingHistoryController extends GetxController {

  var searchText = ''.obs;

  final homeController = Get.put(HomeFetchDataController());

  void dialogBox(String docId) {
    print('Document id:$docId');
    Get.defaultDialog(
      backgroundColor: Colors.amber,
      title: 'Message',
      content: const Text('Do you want to delete this data?'),
      actions: [
        MyButton(
          txt: 'Yes',
          font: 16,
          w: 70.w,
          h: 40.h,
          bacclr: Colors.amber,
          clr: Colors.black,
          ontap: () async {
            print('------------------------1');
            try {
              await FirebaseFirestore.instance
                  .collection('billingHistory')

                  .doc(homeController.userId.value)
                  .collection('history')
                  .doc(docId)
                  .delete();
              Get.back();
            } catch (e) {
              print('Error deleting document: $e');
            }
          },
        ),
        MyButton(
          txt: 'No',
          font: 16,
          w: 70.w,
          h: 40.h,
          bacclr: Colors.amber,
          clr: Colors.black,
          ontap: () {
            Get.back();
          },
        ),
      ],
    );
  }

// DeleteCollection Fuction is for Clear All History Data

  Future<void> deleteBillingHistory() async {
    try {
      // await FirebaseFirestore.instance.collection('billingHistory').doc(homeController.userId.value).delete();
      await FirebaseFirestore.instance
          .collection('billingHistory')
          .doc(homeController.userId.value)
          .collection('history')
          .get()
          .then((snapshot) =>
          snapshot.docs.forEach((doc) => doc.reference.delete()));
    } catch (e) {
      print('Error clearing history');
    }
  }


}