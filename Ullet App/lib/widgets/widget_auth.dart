import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:platzi_trip_flutter/auth/register.dart';
import 'package:platzi_trip_flutter/widgets/widgets.dart';

import '../auth/login.dart';
import '../component/colors.dart';
import 'large_buttons.dart';

Widget wAuthTitle({required String title, required String subtitle}) {
  return Container(
    padding: EdgeInsets.only(bottom: 20),
    alignment: Alignment.topLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(subtitle),
      ],
    ),
  );
}

Widget wRegister(
    {required BuildContext context,
    required String title,
    required String text,
    required Widget function}) {
  return GestureDetector(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: Center(
            child: Row(
              children: [
                Text(text),
                SizedBox(width: 10,),
                Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
              ],
            ),
          )
        ),
      ),
      onTap: () => wPushReplacement(context, function));
}

Widget wDivider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Row(
      children: <Widget>[
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Or conect with",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.selectColor.withOpacity(0.5),
            ),
          ),
        ),
        Expanded(child: Divider()),
      ],
    ),
  );
}

Widget wGoogleSign({required Function onTap}) {
  return Container(
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.mainColor
      ),
      icon: Icon(
        MdiIcons.google,
        size: 20,
      ),
      label: Text("Google"),
      onPressed: () {},
    ),
  );
}
