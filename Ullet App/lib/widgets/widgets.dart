import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:platzi_trip_flutter/auth/forgot_pass.dart';

import '../component/colors.dart';
import 'large_buttons.dart';

Widget wAppLoading() {
  return Container(
    color: AppColor.mainColor,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Future wPushTo(BuildContext context, Widget widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

Future wPushReplacement(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

Widget wForgotPass(BuildContext context) {
  return GestureDetector(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Text(
            "Olvido su pin?",
            style: TextStyle(
              fontSize: 15,
                color: AppColor.selectColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () => wPushTo(context, ForgotPassword()));
}

Future wShowToast({required String msg}) {
  return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.black.withOpacity(0.54),
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG);
}
