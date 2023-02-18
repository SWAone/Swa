import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumer_market/controllor/plyersControolor.dart';
import 'package:sumer_market/controllor/startpagecontrolor.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:sumer_market/screens/plyerDetils.dart';
import 'package:sumer_market/widget/custmContener.dart';
import 'package:sumer_market/widget/plyrsCard.dart';
import 'package:get/get.dart';
import 'package:sumer_market/widget/shimmer.dart';
import 'package:sumer_market/widget/startContener.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sumer_market/widget/taemsContener.dart';

import '../constns/AppColor.dart';

class playrsScrren extends StatelessWidget {
  String bos;
  String loction, name, docId, png, mpng;

  playrsScrren(
      {super.key,
      required this.mpng,
      required this.png,
      required this.bos,
      required this.loction,
      required this.name,
      required this.docId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  color: AppColor.contenerColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ineed.custmText(data: 'رجوع', fontSize: 15.sp),
                              IconButton(
                                  onPressed: () => Get.back(),
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              png.contains(png)
                                  ? StartContener(
                                      width: 100.w,
                                      height: 100.h,
                                      border: 5,
                                      color: AppColor.TextColor,
                                      isHavShadow: true,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image(image: NetworkImage(png)),
                                      )),
                                    )
                                  : Shimmer.fromColors(
                                      child: StartContener(
                                          width: 100.w,
                                          height: 100.h,
                                          border: 5,
                                          color: AppColor.TextColor,
                                          isHavShadow: true,
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                Image(image: NetworkImage(png)),
                                          ))),
                                      baseColor: Colors.grey.withOpacity(0.3),
                                      highlightColor:
                                          Colors.white.withOpacity(0.3)),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ineed.custmText(
                                      data: 'نادي رياضي',
                                      color: Colors.grey,
                                      fontSize: 15.sp,
                                      fontFamily: 'kufi'),
                                  ineed.custmText(
                                      data: name,
                                      fontSize: 20.sp,
                                      fontFamily: 'kufi',
                                      isbold: true),
                                  ineed.custmText(
                                      data: loction,
                                      fontSize: 15.sp,
                                      fontFamily: 'kufi'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            width: double.infinity,
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ineed.custmText(
                                    data: 'مدرب الفريق : $bos',
                                    fontFamily: 'kufi',
                                    fontSize: 15.sp),
                                CircleAvatar(
                                  radius: 33,
                                  backgroundImage: NetworkImage(mpng),
                                  backgroundColor: AppColor.TextColor,
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.contenerColor),
                    child: GetBuilder<plerasControolor>(
                      init: plerasControolor(docid: docId),
                      builder: (controller) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ineed.custmText(
                                  data: 'لاعبي النادي',
                                  fontFamily: 'kufi',
                                  isbold: false,
                                  fontSize: 20.sp,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  if (controller.pllyers.length > 0) {
                                    return InkWell(
                                      // admin
                                      onTap: () {
                                        // Get.defaultDialog(
                                        //     title: 'حذف ام مشاهده',
                                        //     content: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.spaceAround,
                                        //       children: [
                                        //         TextButton(
                                        //             onPressed: () {
                                        //               controller.dletplayers(
                                        //                   pleersId: controller
                                        //                           .playersID[
                                        //                       index]);
                                        //             },
                                        //             child: Text('حذف الاعب')),
                                        //         TextButton(
                                        //             onPressed: () {
                                        //               Get.to(() => deilsPlya(
                                        //                     docId: docId,
                                        //                     playersId: controller
                                        //                             .playersID[
                                        //                         index],
                                        //                     ppng: png,
                                        //                   ));
                                        //             },
                                        //             child: Text(
                                        //                 'مشاهدة التفاصيل')),
                                        //       ],
                                        //     ));
                                        Get.to(() => deilsPlya(
                                              docId: docId,
                                              playersId:
                                                  controller.playersID[index],
                                              ppng: png,
                                            ));
                                      },

                                      child: ListTile(
                                        trailing: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              Image(image: NetworkImage(png)),
                                        ),
                                        subtitle: ineed.custmText(
                                            data: controller.pllyers[index]
                                                ['markz'],
                                            fontFamily: 'kufi',
                                            isbold: false,
                                            fontSize: 10.sp,
                                            color: Colors.white),
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              controller.pllyers[index]
                                                  ['imag']),
                                          radius: 30,
                                          backgroundColor: AppColor.TextColor,
                                        ),
                                        title: ineed.custmText(
                                            data: controller.pllyers[index]
                                                ['name'],
                                            fontFamily: 'kufi',
                                            isbold: true,
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                      ),
                                    );
                                  } else {
                                    return Shimmer.fromColors(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: temsContener(
                                            png:
                                                'https://www.kindacode.com/wp-content/uploads/2021/04/Screen-Shot-2021-04-07-at-19.09.06.jpg?ezimgfmt=rs%3Adevice%2Frscb5-1',
                                            name: '',
                                          ),
                                        ),
                                        baseColor: Colors.grey.withOpacity(0.3),
                                        highlightColor:
                                            Colors.white.withOpacity(0.3));
                                  }
                                },
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Divider(
                                      color: Colors.white,
                                    ),
                                  );
                                },
                                itemCount: controller.pllyers.length > 0
                                    ? controller.pllyers.length
                                    : 11)
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
