import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:sumer_market/widget/startContener.dart';
class archef extends StatelessWidget {
  String cupwin,cupLoction,cupday,cupmonth;
   archef({super.key, required this.cupwin, required this.cupLoction,required this.cupday,required this.cupmonth});

  @override
  Widget build(BuildContext context) {
    return StartContener(
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  Container(
                    width: 310.w,
                    height: 70.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.show_chart_sharp,
                          color: Colors.white,
                          size: 25.sp,
                        ),
                        ineed.custmText(
                            data: 'اخر البطولات التي فاز بها', fontSize: 20.sp),
                        Container(
                            width: 40.w,
                            height: 40.h,
                            child: Image.asset('assets/images/cup.png')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: 1.h,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ineed.custmText(data: cupday, fontSize: 15.sp,isbold: true),
                           ineed.custmText(data: cupmonth, fontSize: 15.sp),
                          ],
                        ),
                        ineed.custmText(data: cupwin,fontSize: 20.sp),
                        Column(
                          children: [
                            Icon(Icons.location_on_rounded,color: Colors.white,size: 20.sp,),
                           ineed.custmText(data: cupLoction,fontSize: 15.sp),


                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              width: double.infinity,
              height: 120.h,
              color: const Color(0xff312F3F),
            );
  }
}