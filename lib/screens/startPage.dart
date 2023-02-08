import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumer_market/addPlaery.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:sumer_market/control.dart';
import 'package:sumer_market/controllor/startpagecontrolor.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:sumer_market/screens/market/marketScreen.dart';
import 'package:sumer_market/screens/marketScrren.dart';
import 'package:sumer_market/screens/players.dart';
import 'package:sumer_market/screens/plyerDetils.dart';
import 'package:sumer_market/widget/custmContener.dart';
import 'package:sumer_market/widget/plyrsCard.dart';
import 'package:sumer_market/widget/startContener.dart';
import 'package:sumer_market/widget/taemsContener.dart';
import 'package:shimmer/shimmer.dart';

class startPage extends StatelessWidget {
  const startPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(startControllor());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: GetBuilder<startControllor>(
              builder: (controller) => Column(children: [
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.contenerColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    height: 210.h,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                  onPressed: () => Get.to(() => controlPage()),
                                  child: Text('add'))),
                          ineed.custmText(
                              data: 'اكادميات بابل', fontSize: 30.sp),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 300.w,
                              height: 45.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xff3F3F3F)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  custemCountener(
                                    onTap: () {
                                      controller.chinglist();
                                    },
                                    text: 'ألاكاديميات',
                                    color: controller.isching
                                        ? const Color(0xff3F3F3F)
                                        : AppColor.TextColor,
                                  ),
                                  custemCountener(
                                    onTap: () {
                                      controller.chinglist();
                                    },
                                    text: 'الاعبين',
                                    color: controller.isching
                                        ? AppColor.TextColor
                                        : const Color(0xff3F3F3F),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StartContener(
                      onTap: () {},
                      color: AppColor.contenerColor,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () =>Get.to(()=> marketScrrenn()),
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: 170.w,
                              height: 130.h,
                              child: Image.asset('assets/images/shos3.png'),
                            ),
                          ),
                          ineed.custmText(data: 'المنتجات', fontSize: 30.sp)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    StartContener(
                      onTap: () {},
                      color: AppColor.contenerColor,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            width: 180.w,
                            height: 130.h,
                            child: Image.asset('assets/images/stadem.png'),
                          ),
                          ineed.custmText(data: 'التمارين', fontSize: 30.sp)
                        ],
                      ),
                    ),
                  ],
                ),
                controller.isching == false
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 27, top: 10, bottom: 5),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: ineed.custmText(
                                    data: 'الاندية الرياضيه ',
                                    fontSize: 20.sp,
                                    color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 5.h,
                              ),
                              shrinkWrap: true,
                              itemCount: controller.teamInfo.length > 0
                                  ? controller.teamInfo.length
                                  : 6,
                              itemBuilder: (context, index) {
                                if (controller.teamInfo.length > 0) {
                                  return temsContener(
                                    png: controller.teamInfo[index]['TL'],
                                    name: controller.teamInfo[index]['TN'],
                                    onTap: () {  Get.to(() => playrsScrren(
                                      
                                              png:  controller.teamInfo[index]
                                              ['TL'],
                                          bos: controller.teamInfo[index]
                                              ['bos'],
                                              loction:controller.teamInfo[index]
                                              ['loction'], 
                                               name: controller.teamInfo[index]
                                              ['TN'],
                                              docId: controller.docid[index],
                                              mpng: controller.teamInfo[index]['mpng'],
                                             
                                        ));
                                        
                                }
                                        
                                  );
                                }
                                return Shimmer.fromColors(
                                    child: temsContener(

                        png: 'https://www.kindacode.com/wp-content/uploads/2021/04/Screen-Shot-2021-04-07-at-19.09.06.jpg?ezimgfmt=rs%3Adevice%2Frscb5-1',

                                      name: '',
                                    ),
                                    baseColor: Colors.grey.withOpacity(0.3),
                                    highlightColor:
                                        Colors.white.withOpacity(0.3));
                              },
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                        plyaersCard(),
                          SizedBox(
                            height: 10.h,
                          ),
                          plyaersCard(),
                          SizedBox(
                            height: 10.h,
                          ),
                          plyaersCard(),
                        ],
                      ),
              ]),
            )),
        backgroundColor: AppColor.backgroundColor,
      ),
    );
  }
}
