import 'package:flutter/material.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumer_market/screens/market/controller/getController.dart';
import 'package:sumer_market/screens/market/widget/itemCard.dart';
import 'package:get/get.dart';
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
                    return Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back_outlined,
                                color: Colors.white,
                              )),
                          ineed.custmText(
                              data: 'متجر سومرالرياضي',
                              fontSize: 15.sp,
                              fontFamily: 'kufi'),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_cart_rounded,
                                color: Colors.white,
                              )),
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.prodect.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 4.h,
                              crossAxisSpacing: 4.w,
                                crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return itemcard(imag: controller.prodect[index]['imag'], price:controller.prodect[index]['price'] , title:controller.prodect[index]['title']  );
                            },
                          ),
                        ),
                      ),
                      
                    ],
                  );
                  },
                ),
              ),
            )),
      ),
    );
  }
}
