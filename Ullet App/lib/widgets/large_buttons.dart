import 'package:flutter/cupertino.dart';
import 'package:platzi_trip_flutter/component/colors.dart';

class AppLargeButton extends StatelessWidget {
   final Color? backgroundColor;
   final String text;
   final Color? textColor;
   final Function()? onTap;
   final bool? isBorder;
   const AppLargeButton({Key? key,
     this.backgroundColor:AppColor.mainColor,
     required this.text,
     this.textColor,
     this.onTap,
     this.isBorder:false,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 30,right: 30),
        height: 60,
        width: MediaQuery.of(context).size.width-60,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: AppColor.mainColor
          )
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: textColor
          ),
          ),
        ),
      ),
    );
  }
}
