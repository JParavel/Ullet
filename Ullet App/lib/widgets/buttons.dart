import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trip_flutter/component/colors.dart';

class AppButtons extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Function()? onTap;
  final Color? backgroundColor;
  final String? text;
  final double? fontSize;
  final Color? textColor;
  const AppButtons({Key? key,
    this.fontSize=20,
    this.textColor=AppColor.mainColor,
    this.iconColor=Colors.white,
    this.backgroundColor=AppColor.mainColor,
    this.text,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor,
            ),
            child: Icon(icon,size: 30,color: iconColor,),
          ),
          text!=null?Text(
            text!,
            style: TextStyle(
              fontSize: 14,
              color: textColor
            ),
          ):Container()
        ],
      ),
    );
  }
}
