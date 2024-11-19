import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TextPasswordController extends GetxController {
  var isChecked = true.obs;

  void onPressed() {
    if (isChecked.value) {
      isChecked.value = false;
    } else {
      isChecked.value = true;
    }
  }
}
