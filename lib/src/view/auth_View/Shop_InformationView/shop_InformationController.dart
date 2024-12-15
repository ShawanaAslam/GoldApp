import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../utills/toast_ Notifications/toast_Notification.dart';

class ShopInfoController extends GetxController {
  TextEditingController shopnameController = TextEditingController();
  TextEditingController shopemailController = TextEditingController();
  TextEditingController shopaddressController = TextEditingController();
  TextEditingController mblController = TextEditingController();
  TextEditingController mblnoController = TextEditingController();
  TextEditingController ptclController = TextEditingController();
  var isLoading = false.obs;

  void onSaveInfo(){

    try{
  isLoading.value = true;
  ///confirmToastMessage(BuildContext context, 'You are registered successfully');
  }
  catch (error) {
  isLoading.value = false;
  // Handle error
 // errorToastMessage(context, error.toString());
}
finally{
  isLoading.value = false;
  shopnameController.clear();
  shopaddressController.clear();
  shopemailController.clear();
  mblController.clear();
  mblnoController.clear();
  ptclController.clear();
}
}
  Future<void>ShopInfo()async{
    try
    {

      String docId=DateTime.now().microsecondsSinceEpoch.toString();

      await FirebaseFirestore.instance.collection('ShopInfo').doc(docId).set({

        'docId':docId,
        'shopName': shopnameController.text,
        'shopEmail':shopemailController.text,
        'shopAddress':shopaddressController.text,
        'mbl':mblController.text,
        'mblNo':mblnoController.text,
        'ptclNo':ptclController.text
      });
    }
    catch (e)
    {

     print('Error:$e');
    }
  }
}

