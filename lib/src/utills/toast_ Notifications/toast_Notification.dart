import '../linker.dart';

void confirmToastMessage(BuildContext context, String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER_RIGHT,
      backgroundColor: AppColors.secondryColor,
      //lightBlueAccent.shade100,
      textColor: Colors.black,
      fontSize: 16);
}

void errorToastMessage(BuildContext context, String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.white,
      //lightBlueAccent.shade100,
      textColor: Colors.black,
      fontSize: 16);
}

void alertToastMessage(BuildContext context, String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.lightBlueAccent.shade100,
      textColor: Colors.white,
      fontSize: 16);
}
