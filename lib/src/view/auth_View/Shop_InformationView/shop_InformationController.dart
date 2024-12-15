import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ShopInfoController extends GetxController {
  TextEditingController shopnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  var isLoading = false.obs;
}
