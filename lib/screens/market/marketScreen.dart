import 'package:flutter/material.dart';
import 'package:sumer_market/addPlaery.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumer_market/screens/market/controller/getController.dart';
import 'package:sumer_market/screens/market/costmer.dart';
import 'package:sumer_market/screens/market/widget/itemCard.dart';
import 'package:get/get.dart';
import 'package:sumer_market/widget/shimmer.dart';
import 'package:shimmer/shimmer.dart';

class marketScrrenn extends StatelessWidget {
  const marketScrrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: AppColor.backgroundColor2,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: GetBuilder<marketController>(
                  init: marketController(),
                  builder: (controller) {
                    return GetBuilder<marketController>(
                      init: marketController(),
                      builder: (cc) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // IconButton(
                                //     onPressed: () {
                                //       Get.back();
                                //     },
                                //     icon: Icon(
                                //       Icons.arrow_back_outlined,
                                //       color: Colors.white,
                                //     )),
                                // InkWell(
                                //   onTap: () {
                                //     Get.to(() => costmer());
                                //   },
                                //   child: ineed.custmText(
                                //       data: '${cc.zaboon} طلبات شراء',
                                //       color: Colors.amber,
                                //       isbold: true,
                                //       fontSize: 15.sp,
                                //       fontFamily: 'kufi'),
                                // ),
                                ineed.custmText(
                                    data: 'متجر سومرالرياضي',
                                    fontSize: 15.sp,
                                    fontFamily: 'kufi'),
                                // IconButton(
                                //     onPressed: () {
                                //       Get.defaultDialog(
                                //           title: 'اضافة منتج',
                                //           content: Form(
                                //             key: cc.form,
                                //             child: Column(
                                //               children: [
                                //                 addp.forma(
                                //                     onSaved: (p0) =>
                                //                         cc.title = p0,
                                //                     label: 'اسم المنتج'),
                                //                 addp.forma(
                                //                     onSaved: (p0) =>
                                //                         cc.price = p0,
                                //                     label: 'سعر المنتج'),
                                //                 addp.forma(
                                //                     onSaved: (p0) =>
                                //                         cc.imag = p0,
                                //                     label: 'رابط صورة المنتج '),
                                //                 addp.forma(
                                //                     onSaved: (p0) =>
                                //                         cc.ProdectIdd = p0,
                                //                     label: 'ID'),
                                //                 TextButton(
                                //                     onPressed: () {
                                //                       cc.addProdect();
                                //                     },
                                //                     child: Text('اضافة'))
                                //               ],
                                //             ),
                                //           ));
                                //     },
                                //     icon: Icon(
                                //       Icons.add,
                                //       color: Colors.white,
                                //     )),
                              ],
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
                            Container(
                              width: double.infinity,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: AppColor.TextColor,
                                      size: 19.sp,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    ineed.custmText(
                                        data: 'بحث',
                                        fontSize: 15.sp,
                                        color: AppColor.TextColor),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: cc.docId.length > 0
                                      ? controller.prodect.length
                                      : 12,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 4.h,
                                          crossAxisSpacing: 4.w,
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    return cc.docId.length > 0
                                        ? itemcard(
                                            onTap: () {
                                              print('object');
                                              cc.bayProdect(
                                                  docid: cc.docId[index]);
                                            },
                                            imag: controller.prodect[index]
                                                ['imag'],
                                            price: controller.prodect[index]
                                                ['price'],
                                            title: controller.prodect[index]
                                                ['title'])
                                        : Shimmer.fromColors(
                                            child: itemcard(
                                                onTap: () {},
                                                imag:
                                                    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                                                price: '90',
                                                title: 'title'),
                                            baseColor:
                                                Colors.grey.withOpacity(0.3),
                                            highlightColor:
                                                Colors.white.withOpacity(0.3));
                                    ;
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            )),
      ),
    );
  }
}
