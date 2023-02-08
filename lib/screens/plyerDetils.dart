import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:sumer_market/controllor/plyerDetilsControlorr.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:sumer_market/widget/archef.dart';
import 'package:sumer_market/widget/custmContener.dart';
import 'package:sumer_market/widget/detils.dart';
import 'package:sumer_market/widget/startContener.dart';
import 'package:shimmer/shimmer.dart';

class deilsPlya extends GetView<plyerDetilsControlorr> {
  String docId, playersId,ppng;
  deilsPlya({super.key, required this.ppng, required this.docId, required this.playersId});

  @override
  Widget build(BuildContext context) {
    Get.put(plyerDetilsControlorr(docId: docId, playersID: playersId));
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<plyerDetilsControlorr>(
            init: plyerDetilsControlorr(docId: docId, playersID: playersId),
            builder: (controller) {
              return controller.istrue? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 25.sp,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 350.h,
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child:  Image(image: NetworkImage(ppng),
                                opacity: const AlwaysStoppedAnimation(0.1))),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Image(image: NetworkImage('${controller.png}'))),
                      
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child:  Image(image: NetworkImage(ppng)),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 35.w, vertical: 8.h),
                              width: 40.w,
                              height: 37.h,
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            width: 300.w,
                            height: 50.h,
                            child: ineed.custmText(
                                data: '${controller.name}',
                                fontSize: 26.sp,
                                fontFamily: 'kufi'),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 120.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                detilsCont(title: 'العمر',
                                  body: '${controller.age}',),
                                detilsCont(
                                  title: 'المباريات',
                                  body: '${controller.games}',
                                ),
                                detilsCont(
                                  title: 'الاهداف',
                                  body: '${controller.goal}',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              height: 0.5.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        ineed.custmText(data: 'ارشيف الاعب', fontSize: 20.sp),
                  ),
                  archef(
                      cupLoction: '${controller.cupLoction}',
                      cupday: '${controller.cupday}',
                      cupmonth: '${controller.cupmonth}',
                      cupwin: '${controller.cupWin}'),
                  SizedBox(
                    height: 10.h,
                  ),
                  ineed.custmText(data: 'معلومات اخرى', fontSize: 20.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [detilsCont(title: "المركز",body: controller.markz,),detilsCont(body: controller.size,title: "الطول",),detilsCont(title: "الوزن",body: controller.wzn,)],
                      ),SizedBox(height: 10.h,),
                       Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [detilsCont(title: "السكن",body: controller.from,),detilsCont(body: controller.feedback,title: "التقيم",),detilsCont(title: "التولد",body: controller.born,)],
                      )
                    ],
                  )
                ],
              ): Shimmer.fromColors(
                                    child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 25.sp,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 350.h,
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset('assets/images/realMadred.png',
                                opacity: const AlwaysStoppedAnimation(0.1))),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset('assets/images/cr7.png')),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child:
                                  Image.asset('assets/images/realMadred.png'),
                              margin: EdgeInsets.symmetric(horizontal: 60.w),
                              width: 40.w,
                              height: 45.h,
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: Image.asset('assets/images/Portugal.png'),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 35.w, vertical: 8.h),
                              width: 40.w,
                              height: 37.h,
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            width: 300.w,
                            height: 50.h,
                            
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 120.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                detilsCont(title: 'العمر',
                                  body: '${controller.age}',),
                                detilsCont(
                                  title: 'المباريات',
                                  body: '${controller.games}',
                                ),
                                detilsCont(
                                  title: 'الاهداف',
                                  body: '${controller.goal}',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              color: Colors.white,
                              height: 0.5.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        ineed.custmText(data: 'ارشيف الاعب', fontSize: 20.sp),
                  ),
                  archef(
                      cupLoction: 'sd',
                      cupday: '22',
                      cupmonth: 'OCT',
                      cupwin: ' العراقي'),
                  SizedBox(
                    height: 10.h,
                  ),
                  ineed.custmText(data: 'معلومات اخرى', fontSize: 20.sp),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [detilsCont(),detilsCont(),detilsCont(),],
                      ),SizedBox(height: 10.h,),
                       Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [detilsCont(),detilsCont(),detilsCont()],
                      )
                    ],
                  )
                ],
              ),
                                    baseColor: Colors.grey.withOpacity(0.3),
                                    highlightColor:
                                        Colors.white.withOpacity(0.3));;
            },
          ),
        ),
      ),
    ));
  }
}
