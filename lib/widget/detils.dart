import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:sumer_market/widget/custmContener.dart';
import 'package:sumer_market/widget/startContener.dart';
class detilsCont extends StatelessWidget {
   detilsCont({super.key,this.title, this.body,this.issbold=true});
  String? title;
     String? body;
     bool issbold;
     
  @override
  Widget build(BuildContext context) {
    return 
                        StartContener(
                          width: 90.w,
                          height: 100.h,
                          color: const Color(0xff312F3F),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  
                                  alignment: Alignment.topLeft,
                                    child: ineed.custmText(
                                        data: '$title', fontSize: 15.sp)),
                                Align(
                                                                  alignment: Alignment.bottomRight,

                                    child: ineed.custmText(
                                        data: '$body', fontSize: 18.sp,isbold: issbold? true:false)),
                              ],
                            ),
                          ),
                        );
  }
}