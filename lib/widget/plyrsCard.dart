import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:sumer_market/screens/plyerDetils.dart';
import 'package:sumer_market/widget/custmContener.dart';
import 'package:get/get.dart';

class plyaersCard extends StatelessWidget {
  const plyaersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {Get.to(()=>deilsPlya());},
      child: Container(
                      width: 320.w,
                      height: 130.h,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                                decoration:
                              BoxDecoration(border: Border.all(color: Colors.white)),
                                                width: 300.w,
                                                height: 100.h,
                                                
                                                child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ineed.custmText(
                                      data: 'مهاجم',
                                      fontFamily: 'kufi',
                                      fontSize: 15.sp),
                                  ineed.custmText(
                                      data: '7',
                                      fontFamily: 'kufi',
                                      fontSize: 35.sp,
                                      isbold: true),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ineed.custmText(
                                        data: 'رونالدو',
                                        fontFamily: 'kufi',
                                        fontSize: 20.sp,
                                        isbold: true),
                                        Row(
                                          children: [
                                             Container(
                                  width: 30.w,
                                  height: 25.h,
                                  child: Image.asset(
                                    'assets/images/realMadred.png',
                                    
                                  ),
                                ),
                                
                                    ineed.custmText(
                                        data: 'ريال مدريد',
                                        fontFamily: 'kufi',
                                        fontSize: 15.sp,
                                        ),
                                          ],
                                        )
                          
                                  ],
                                ),
                              ),
                              Container(
                                width: 40.w,
                                height: 95.h,
                                
                              ),
                            ],
                                                ),
                                              ),
                          ),
                           Align(alignment: Alignment.topLeft,
                             child: Padding(
                               padding: const EdgeInsets.only(bottom: 1,left: 10),
                               child: Container(
                                    width: 90.w,
                                    height: 200.h,
                                    child: Image.asset(
                                      'assets/images/cr7.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                             ),
                           )
                        ],
                      ),
                    ),
    );
  }
}