import 'package:flutter/material.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class custemCountener extends StatelessWidget {
  custemCountener(
      {super.key,
      this.border = 0,
      this.text = '',
      this.fontSize = 20,
      this.fontFamily = 'Cairo',
      this.color = Colors.white,
      this.height = 35,
      this.width = 140,
      this.TextColor = Colors.white,
      this.isHavShadow = false,
      this.isbold=false,
      this.onTap});
  double border;
 bool isbold;
  String text;
  double fontSize;
  String fontFamily;
  Color color;
  double width;
  double height;
  Color TextColor;
  bool isHavShadow;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          
            boxShadow: [
              isHavShadow?
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 5,
                  color: Color.fromARGB(255, 230, 215, 170)):BoxShadow(
                  spreadRadius: 0.0,
                  blurRadius: 0.0,
               )
            ],
            borderRadius: border == 0
                ? BorderRadius.circular(20)
                : BorderRadius.circular(border),
            color: color
            
            ),
        child: Center(
            child: ineed.custmText(
              isbold: isbold?true:false,
                data: text,
                fontSize: fontSize.sp,
                fontFamily: fontFamily,
                color: TextColor)),
      ),
    );
  }
}
