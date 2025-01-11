
import 'package:goldapp/src/utills/linker.dart';



class TextPasswordController extends GetxController {
  TextEditingController controller=TextEditingController();
  TextEditingController confirmController=TextEditingController();
  var isChecked = true.obs;
  var confirmChecked=true.obs;

  void onPressed() {
    if (isChecked.value) {
      isChecked.value = false;
    } else {
      isChecked.value = true;
    }
  }
  void onConfirmPressed(){
    if(confirmChecked.value){
      confirmChecked.value=false;
    }
    else{
      confirmChecked.value=true;
    }
  }
}
