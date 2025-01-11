


import '../../../utills/linker.dart';

class HistoryController extends GetxController {

 // TextEditingController searchController = TextEditingController();
  var searchText = ''.obs;

  final homeController = Get.put(HomeFetchDataController());

void dialogBox(String docId){
  Get.defaultDialog(
    backgroundColor: Colors.amber,
    title: 'Message',
    content: const Text(
        'Do you want to delete this data?'),
    actions: [
      MyButton(
        txt: 'Yes',
        font: 16,
        w: 70.w,
        h: 40.h,
        bacclr: Colors.amber,
        clr: Colors.black,
        ontap: () async {
          await FirebaseFirestore.instance
              .collection(homeController.userId.value)
          // .doc(data.docs[index].id)
              .doc(docId)
              .delete();
          Get.back();
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
