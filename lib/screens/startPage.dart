// ignore_for_file: sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sumer_market/addPlaery.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:sumer_market/control.dart';
import 'package:sumer_market/controllor/startpagecontrolor.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:sumer_market/screens/machScreen.dart';
import 'package:sumer_market/screens/market/marketScreen.dart';
import 'package:sumer_market/screens/players.dart';
import 'package:sumer_market/widget/custmContener.dart';
import 'package:sumer_market/widget/plyrsCard.dart';
import 'package:sumer_market/widget/startContener.dart';
import 'package:sumer_market/widget/taemsContener.dart';
import 'package:shimmer/shimmer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

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
                    height: 160.h,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // Align(
                          //   alignment: Alignment.topRight,
                          //   child: TextButton(
                          //       onPressed: () {
                          //         Get.defaultDialog(
                          //             content: Form(
                          //           key: controller.postkey,
                          //           child: Column(
                          //             children: [
                          //               addp.forma(
                          //                   onSaved: (p0) =>
                          //                       controller.title = p0,
                          //                   label: 'نص المنشور'),
                          //               addp.forma(
                          //                   onSaved: (p0) =>
                          //                       controller.imag = p0,
                          //                   label: 'رابط الصورة'),
                          //               IconButton(
                          //                   onPressed: () {
                          // controller.AddPost();
                          //                   },
                          //                   icon: Icon(
                          //                     Icons.add,
                          //                     color: Colors.green,
                          //                   ))
                          //             ],
                          //           ),
                          //         ));
                          //       },
                          //       child: ineed.custmText(
                          //           data: 'اضافة منشور', color: Colors.red)),
                          // ),
                          // Align(
                          //     alignment: Alignment.topLeft,
                          //     child: TextButton(
                          //         onPressed: () => Get.to(() => controlPage()),
                          //         child: Text('add'))),
                          ineed.custmText(data: 'سومر', fontSize: 30.sp),
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
                                    text: 'النشاطات ',
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
                            onTap: () => Get.to(() => marketScrrenn()),
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: 170.w,
                              height: 130.h,
                              child: Image.asset('assets/images/shos3.png'),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          ineed.custmText(data: 'المنتجات', fontSize: 17.sp)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    StartContener(
                      onTap: () {
                        Get.to(() => machScrren());
                      },
                      color: AppColor.contenerColor,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            width: 180.w,
                            height: 130.h,
                            child: Image.asset(
                              'assets/images/match.png',
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ineed.custmText(
                              data: 'مواعيد المباريات', fontSize: 17.sp)
                        ],
                      ),
                    ),
                  ],
                ),
                controller.isching
                    ? SizedBox(
                        height: 10.h,
                      )
                    : SizedBox(
                        height: 0.h,
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
                                    data: 'الفرق الرياضيه',
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
                                      onTap: () {
                                        Get.to(() => playrsScrren(
                                              png: controller.teamInfo[index]
                                                  ['TL'],
                                              bos: controller.teamInfo[index]
                                                  ['bos'],
                                              loction: controller
                                                  .teamInfo[index]['loction'],
                                              name: controller.teamInfo[index]
                                                  ['TN'],
                                              docId: controller.docid[index],
                                              mpng: controller.teamInfo[index]
                                                  ['mpng'],
                                            ));
                                      });
                                }
                                return Shimmer.fromColors(
                                    child: temsContener(
                                      png:
                                          'https://www.kindacode.com/wp-content/uploads/2021/04/Screen-Shot-2021-04-07-at-19.09.06.jpg?ezimgfmt=rs%3Adevice%2Frscb5-1',
                                      name: '',
                                    ),
                                    baseColor: Colors.grey.withOpacity(0.3),
                                    highlightColor:
                                        Colors.white.withOpacity(0.3));
                              },
                            ),
                          ),
                        ],
                      )
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return controller.postId.length > 0
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.contenerColor,
                                    ),
                                    width: double.infinity,
                                    child: Stack(
                                      children: [
                                        // Align(
                                        //   alignment: Alignment.topLeft,
                                        //   child: IconButton(
                                        //       onPressed: () {
                                        //         Get.defaultDialog(
                                        //             content: TextButton(
                                        //                 onPressed: () {
                                        //                   controller.dletPost(
                                        //                       docidd: controller
                                        //                               .postId[
                                        //                           index]);
                                        //                 },
                                        //                 child: Text(
                                        //                     'تاكيد الحذف')));
                                        //       },
                                        //       icon: Icon(
                                        //         Icons.delete,
                                        //         color: Colors.red,
                                        //       )),
                                        // ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  const CircleAvatar(
                                                    radius: 28,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/acdd.png'),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Column(
                                                    children: [
                                                      ineed.custmText(
                                                          data: 'اعلام سومر',
                                                          fontSize: 15.sp,
                                                          isbold: true),
                                                      ineed.custmText(
                                                        data: '12/2',
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 300.w,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ineed.custmText(
                                                    data: controller
                                                        .posts[index]['title'],
                                                    fontSize: 15.sp),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                width: double.infinity,
                                                height: 250.h,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: Image(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          controller
                                                                  .posts[index]
                                                              ['imag'])),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  ////// اذا جان فارغ
                                )
                              : Shimmer.fromColors(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColor.contenerColor,
                                      ),
                                      width: double.infinity,
                                      child: Container(
                                        width: 300.w,
                                        height: 250.h,
                                      ),
                                    ),
                                  ),
                                  baseColor: Colors.grey.withOpacity(0.3),
                                  highlightColor:
                                      Colors.white.withOpacity(0.3));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 7.h,
                          );
                        },
                        itemCount: controller.postId.length > 0
                            ? controller.postId.length
                            : 10)
              ]),
            )),
        backgroundColor: AppColor.backgroundColor,
      ),
    );
  }
}
