import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartContener extends StatelessWidget {
   StartContener({super.key,this.color=Colors.white,this.height=190,this.width=160,this.child,this.onTap,this.border=0.0,this.isHavShadow=false});
   double width;
      double height;
      Color color;
      Widget? child;
       bool isHavShadow;
         double border;

void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  
             InkWell(
              onTap:onTap ,
               child: Container(
                width: width.w,
                height: height.h,
                decoration: BoxDecoration(
                   boxShadow: [
              isHavShadow?
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 5,
                  color: Color.fromARGB(255, 156, 61, 61)):BoxShadow(
                  spreadRadius: 0.0,
                  blurRadius: 0.0,
               )
            ],
                   borderRadius: border == 0
                ? BorderRadius.circular(20)
                : BorderRadius.circular(border),
            color: color
            
          
             
                    
                    ),
                    child: child,
                   
                ),
             );

         
  }
}