import '../../../utills/linker.dart';

class HistoryController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var searchText = ''.obs;

  final homeController = Get.put(HomeFetchDataController());

  void dialogBox(String docId) {
    print('Document id:$docId');
    Get.defaultDialog(
      backgroundColor: Colors.amber,
      title: 'Message$docId',
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
                  //(homeController.userId.value)
                  // .doc(data.docs[index].id)
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

  Future<void> deleteCollection() async {
    try {
      String collectionName = homeController.userId.value;
      final collectionRef =
          await FirebaseFirestore.instance.collection(collectionName);
      final snapshot = await collectionRef.get();
      // 4th for each
      //for(int i=1;i<=10;i++){}

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print('error clearing history');
    }
  }
}
//--------------------------------------------------------------------
//history true coding
//import '../../../utills/linker.dart';
//
// class HistoryController extends GetxController {
//
//   TextEditingController searchController = TextEditingController();
//   var searchText = ''.obs;
//
//   final homeController = Get.put(HomeFetchDataController());
//
// void DialogBox(String docId){
//   Get.defaultDialog(
//     backgroundColor: Colors.amber,
//     title: 'Message',
//     content: const Text(
//         'Do you want to delete this data?'),
//     actions: [
//       MyButton(
//         txt: 'Yes',
//         font: 16,
//         w: 70.w,
//         h: 40.h,
//         bacclr: Colors.amber,
//         clr: Colors.black,
//         ontap: () async {
//           await FirebaseFirestore.instance
//               .collection(homeController.userId.value)
//           // .doc(data.docs[index].id)
//               .doc(docId)
//               .delete();
//           Get.back();
//         },
//       ),
//       MyButton(
//         txt: 'No',
//         font: 16,
//         w: 70.w,
//         h: 40.h,
//         bacclr: Colors.amber,
//         clr: Colors.black,
//         ontap: () {
//           Get.back();
//         },
//       ),
//     ],
//   );
// }
//
// // DeleteCollection Fuction is for Clear All History Data
//
//   Future<void> deleteCollection() async {
//     try {
//       String collectionName = homeController.userId.value;
//       final collectionRef =
//       await FirebaseFirestore.instance.collection(collectionName);
//       final snapshot = await collectionRef.get();
//       // 4th for each
//       //for(int i=1;i<=10;i++){}
//
//       for (var doc in snapshot.docs) {
//         await doc.reference.delete();
//       }
//     } catch (e) {
//       print('error clearing history');
//     }
//   }
//
// }
