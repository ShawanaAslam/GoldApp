



import '../../../utills/linker.dart';
import 'Forget_Widgets/inkwell_Widget.dart';
import 'Forget_Widgets/txtFormField_widget.dart';
import 'forget_Controller.dart';

class ForgetPasword extends StatelessWidget {
 final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ForgetController obj = Get.put(ForgetController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EmailTextformfield(clr: Colors.black,
                controller: obj.paswordController,
                lbltxt: 'Enter Email For Password Reset',

              ),
              SizedBox(height: 40),
              Obx(() {
                return obj.isloading.value
                    ? AppLoading()
                    : InkwellWidget(
                  txt: 'Reset Password',
                  clr: Colors.amber,
                  ontap: () {
                   if (_key.currentState!.validate()) {
                      obj.forget(context);
                    }
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
