import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumer_market/addPlaery.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:sumer_market/controllor/dateMachControlloer.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class machScrren extends StatelessWidget {
  const machScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<machController>(
        init: machController(),
        builder: (cc) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // admin
                  // IconButton(
                  //   onPressed: () {
                  //     Get.defaultDialog(
                  //         content: Form(
                  //       key: cc.formm,
                  //       child: Column(
                  //         children: [
                  //           addp.forma(
                  //               onSaved: (p0) => cc.Ftime = p0,
                  //               label: 'الفريق الاول'),
                  //           addp.forma(
                  //               onSaved: (p0) => cc.Ltime = p0,
                  //               label: 'الفريق الثاني'),
                  //           addp.forma(
                  //               onSaved: (p0) => cc.time = p0, label: 'الوقت'),
                  //           addp.forma(
                  //               onSaved: (p0) => cc.studem = p0,
                  //               label: 'الملعب'),
                  //           addp.forma(
                  //               onSaved: (p0) => cc.day = p0, label: 'يا يوم'),
                  //           TextButton(
                  //               onPressed: () {
                  //                 cc.addMach();
                  //               },
                  //               child: Text('نشر '))
                  //         ],
                  //       ),
                  //     ));
                  //   },
                  //   icon: Icon(
                  //     Icons.add,
                  //     size: 26.sp,
                  //   ),
                  //   color: Colors.white,
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ineed.custmText(data: 'مواعيد المباريات', fontSize: 20.sp),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 5.h,
                      );
                    },
                    shrinkWrap: true,
                    itemCount: cc.Allmach.length > 0 ? cc.Allmach.length : 10,
                    itemBuilder: (context, index) {
                      return cc.Allmach.length > 0
                          ? InkWell(
                              onTap: () {
                                // admmmn
                                // Get.defaultDialog(
                                //     content: TextButton(
                                //         onPressed: () {
                                //           cc.dleatmach(macId: cc.machId[index]);
                                //         },
                                //         child: Text('حذف ')));
                              },
                              child: mach(
                                  ftime: cc.Allmach[index]['Ftime'],
                                  day: cc.Allmach[index]['day'],
                                  ltime: cc.Allmach[index]['Ltime'],
                                  studem: cc.Allmach[index]['studem'],
                                  time: cc.Allmach[index]['time']),
                            )
                          : Shimmer.fromColors(
                              child: mach(
                                  ftime: ' ',
                                  day: ' ',
                                  ltime: ' ',
                                  studem: ' ......... ',
                                  time: ' '),
                              baseColor: Colors.grey.withOpacity(0.3),
                              highlightColor: Colors.white.withOpacity(0.3));
                      ;
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    ));
  }

  Widget mach({required String ftime, ltime, day, time, studem}) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      width: 300.w,
      height: 100.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ineed.custmText(
                  data: ftime,
                  color: Colors.white,
                  fontSize: 15.sp,
                  isbold: true,
                  fontFamily: "kufi"),
              Column(
                children: [
                  ineed.custmText(
                      data: day,
                      color: Colors.white,
                      fontSize: 15.sp,
                      isbold: true,
                      fontFamily: "kufi"),
                  ineed.custmText(
                      data: time,
                      color: Colors.white,
                      fontSize: 15.sp,
                      isbold: true,
                      fontFamily: "kufi"),
                  ineed.custmText(
                      data: studem,
                      color: Colors.white,
                      fontSize: 15.sp,
                      isbold: true,
                      fontFamily: "kufi"),
                ],
              ),
              ineed.custmText(
                  data: ltime,
                  color: Colors.white,
                  fontSize: 15.sp,
                  isbold: true,
                  fontFamily: "kufi"),
            ],
          )
        ],
      ),
    );
  }
}
