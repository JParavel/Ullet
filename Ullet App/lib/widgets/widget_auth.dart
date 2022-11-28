import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../component/colors.dart';
import 'large_buttons.dart';

Widget wAuthTitle({required String title,required String subtitle}){
  return Container(
    padding: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),),
        SizedBox(height: 5,),
        Text(subtitle),
      ],
    ),
  );
}


Widget wRegister({
  required String text,required String title,required Function onTap}){
  return Container(
    margin: EdgeInsets.only(top: 40),
    child: Row(
      children: <Widget>[
        Text(text),
        GestureDetector(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
          onTap: ()=> onTap,
        ),
      ],
    ),
  );
}

Widget wDivider(){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Row(
      children: <Widget>[
        Expanded(child: Divider()),
        Padding(padding: const EdgeInsets.all(10),
          child: Text(
            "Or conect with",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.selectColor.withOpacity(0.5),
            ),),
        ),
        Expanded(child: Divider()),
      ],
    ),
  );
}

Widget wGoogleSign({required Function onTap}){
  return Container(
    child: ElevatedButton.icon(
      icon: Icon(MdiIcons.google,
        size: 20,
      ),
      label: Text("Google"),
      onPressed: () {},
    ),
  );
}