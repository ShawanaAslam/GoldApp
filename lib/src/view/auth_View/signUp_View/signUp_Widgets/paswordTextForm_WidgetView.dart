
// PaswordTextFormFeild with Getx

import '../../../../utills/linker.dart';
import 'paswordTextForm_WidgetController.dart';

// PaswordTextFormFeild with Getx

class PaswordTextForm extends StatefulWidget {
  TextEditingController controller;
  String hnttxt;
  Color clr;
  Widget? prefixicn;

  PaswordTextForm({
    super.key,
    required this.controller,
    required this.hnttxt,
    this.clr = Colors.white,
    this.prefixicn,
  });

  @override
  State<PaswordTextForm> createState() => _PaswordTextFormState();
}

class _PaswordTextFormState extends State<PaswordTextForm> {
  @override
  Widget build(BuildContext context) {
    TextPasswordController obj = Get.put(TextPasswordController());

    return Obx(
          () => Padding(
        padding: EdgeInsets.only(right: 30, left: 30),
        child: TextFormField(
          controller: widget.controller,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.amber,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your ${widget.hnttxt}';
            }
            // if(hnttxt =='User name' && !RegExp(r'^[a-zA-z]').hasMatch(value))
            // {
            //   return 'Username must start with a letter';
            // }
            // if (hnttxt == 'Email' && !RegExp(r'^[\w-\.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,}$').hasMatch(value)) {
            //   return 'Please enter a valid email address';
            // }
            // if(hnttxt =='Enter Email' && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4$}').hasMatch(value))
            // {
            //   return 'Please enter a valid email address';
            // }
            if (widget.hnttxt == 'Enter Pasword' && value.length < 8) {
              return 'Pasword must be at least 8 characters long';
            }
            if (widget.hnttxt == 'Enter Password' &&
                !RegExp(r'^(?=.[A-Za-z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%*?&]{8,}$')
                    .hasMatch(value)) {
              return 'Password must contain letters, numbers, and special characters';
            }

            if (widget.hnttxt == 'Confirm Password' &&
                value != obj.confirmController.text) {
              return 'Passwords do not match';
            }

            return null;
          },
          obscureText: // widget.hnttxt=='Enter Pasword'?
          obj.isChecked.value, //:obj.confirmChecked.value,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.amber,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    if (widget.hnttxt == 'Enter Pasword') {
                      obj.onPressed();
                    } else {
                      obj.confirmChecked();
                    }
                  },
                  icon: obj.isChecked.value || obj.confirmChecked.value
                      ? Icon(
                    Icons.remove_red_eye,
                    color: Colors.amber,
                  )
                      : Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.amber,
                  )),
              fillColor: Colors.black,
              filled: true,
              hintText: widget.hnttxt,
              errorStyle: TextStyle(color: AppColors.secondryColor),
              hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.circular(10), // Border when focused
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
    );
  }
}

//////-----------------------------------------------------------------

// PaswordTextFormFeild withOut Getx
class PaswordTextformfield extends StatefulWidget {
  final TextEditingController controller;
  final String hnttxt;
  final Color clr;
  final Widget? prefixicn;
  final TextInputType keyboardtype;

  PaswordTextformfield({
    super.key,
    this.keyboardtype = TextInputType.text,
    required this.controller,
    required this.hnttxt,
    this.clr = Colors.white,
    this.prefixicn,
  });

  @override
  State<PaswordTextformfield> createState() => _PaswordTextformfieldState();
}

class _PaswordTextformfieldState extends State<PaswordTextformfield> {
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.amber,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter ${widget.hnttxt}';
          }
          if (widget.hnttxt == 'Enter Pasword') {
            if (value.length < 8) {
              return 'Password must be at least 8 characters long';
            }
            if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%?&])[A-Za-z\d@$!%*?&]{8,}$')
                .hasMatch(value)) {
              return 'Password must include at least one letter, one number, and one special character';
            }
          }
          if (widget.hnttxt == 'Confirm Pasword' && value != widget.controller.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        obscureText: secure,
        obscuringCharacter: '*',
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: widget.prefixicn ?? Icon(Icons.lock, color: AppColors.secondryColor),
          suffixIcon: IconButton(
            onPressed: () => setState(() => secure = !secure),
            icon: Icon(
              secure ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
              color: AppColors.secondryColor,
            ),
          ),
          fillColor: AppColors.primryColor,
          filled: true,
          hintText: widget.hnttxt,
          errorStyle: TextStyle(color: AppColors.secondryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.amber),
          ),
          hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

// class PaswordTextformfield extends StatefulWidget {
//   TextEditingController controller;
//   // TextEditingController? confirmController;
//   String hnttxt;
//   Color clr;
//   Widget? prefixicn;
//   TextInputType keyboardtype;
//
//   PaswordTextformfield(
//       {super.key,
//         //required this.confirmController,
//         this.keyboardtype = TextInputType.text,
//         required this.controller,
//         required this.hnttxt,
//         this.clr = Colors.white,
//         this.prefixicn});
//
//   @override
//   State<PaswordTextformfield> createState() => _PaswordTextformfieldState();
// }
//
// class _PaswordTextformfieldState extends State<PaswordTextformfield> {
//   bool secure = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 30, right: 30),
//       child: TextFormField(
//      //   keyboardType: keyboardtype,
//         style: TextStyle(color: Colors.white),
//         cursorColor: Colors.amber,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please ${widget.hnttxt}';
//           }
//           // if(hnttxt =='User name' && !RegExp(r'^[a-zA-z]').hasMatch(value))
//           // {
//           //   return 'Username must start with a letter';
//           // }
//           // if (hnttxt == 'Email' && !RegExp(r'^[\w-\.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,}$').hasMatch(value)) {
//           //   return 'Please enter a valid email address';
//           // }
//           // if(hnttxt =='Enter Email' && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4$}').hasMatch(value))
//           // {
//           //   return 'Please enter a valid email address';
//           // }
//           if (widget.hnttxt == 'Enter Pasword' && value.length < 8) {
//             return 'Pasword must be at least 8 characters long';
//           }
//           if (widget.hnttxt == 'Enter Pasword' &&
//               !RegExp(r'^(?=.[A-Za-z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%*?&]{8,}$')
//                   .hasMatch(value)) {
//             return 'Password must contain letters, numbers, \nand special characters';
//           }
//
//           if (widget.hnttxt == 'Confirm Pasword' &&
//               value != widget.controller.text) {
//             return 'Passwords do not match';
//           }
//
//           return null;
//         },
//         obscureText: secure,
//         obscuringCharacter: '*',
//         controller: widget.controller,
//         decoration: InputDecoration(
//             prefixIcon: Icon(
//               Icons.lock,
//               color: AppColors.secondryColor,
//             ),
//             suffixIcon: IconButton(
//               onPressed: () {
//                 if (secure == false) {
//                   setState(() {
//                     secure = true;
//                   });
//                 } else if (secure == true) {
//                   setState(() {
//                     secure = false;
//                   });
//                 }
//               },
//               icon: secure
//                   ? Icon(
//                 Icons.remove_red_eye,
//                 color: AppColors.secondryColor,
//               )
//                   : Icon(
//                 Icons.remove_red_eye_outlined,
//                 color: AppColors.secondryColor,
//               ),
//             ),
//             fillColor: AppColors.primryColor,
//             filled: true,
//             hintText: widget.hnttxt,
//             errorStyle: TextStyle(color: AppColors.secondryColor),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                 color: Colors.amber,
//               ),
//             ),
//             hintStyle: TextStyle(color: Colors.amber, fontSize: 14),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.amber,
//               ),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.amber,
//               ),
//               borderRadius: BorderRadius.circular(10), // Border when focused
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.amber,
//               ),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.white),
//               borderRadius: BorderRadius.circular(10),
//             )),
//       ),
//     );
//   }
// }

