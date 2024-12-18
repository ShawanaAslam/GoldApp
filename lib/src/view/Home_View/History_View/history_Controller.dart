

import '../../../utills/linker.dart';

class HistoryController extends GetxController {

  TextEditingController searchController = TextEditingController();
  var searchText = ''.obs;

  final homeController = Get.put(HomeFetchDataController());

void DialogBox(String docId){
  Get.defaultDialog(
    backgroundColor: Colors.amber,
    title: 'Message',
    content: const Text(
        'Do you want to delete this data?'),
    actions: [
      MyButton(
        txt: 'Yes',
        font: 16,
        w: 50.w,
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
        w: 50.w,
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

}