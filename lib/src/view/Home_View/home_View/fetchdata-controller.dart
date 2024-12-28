import '../../../utills/linker.dart';

class HomeFetchDataController extends GetxController {
  var userId = ''.obs;
  var userEmail = ''.obs;
  // best approach: late
  var userName = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = await FirebaseAuth.instance.currentUser;
      if (user != null) // false
      {
        userEmail.value = await user!.email ?? '';
        userId.value = user.uid ?? '';
        if (userEmail != null) {
          final userdocs = await FirebaseFirestore.instance
              .collection('UserData')
              .where('email', isEqualTo: userEmail.value)
              .get();
          if (userdocs.docs.isNotEmpty) {
            //setState(() {
            userName.value = userdocs.docs.first['name'];
            //  });
          }
        }
      } else {
        userEmail.value = 'please login';
        userName.value = 'please login';
        userId.value = '';
      }
    } catch (error) {
      print('Error:$error');
      Get.snackbar('Error', 'Error:$error');
    }
  }
}
