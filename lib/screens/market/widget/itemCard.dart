import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:sumer_market/ineed/ineed.dart';

class itemcard extends StatelessWidget {
  String title, price, imag;
  void Function()? onTap;
  itemcard(
      {super.key,
      required this.onTap,
      required this.imag,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 200.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.9)),
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: NetworkImage(imag),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: 160.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.9),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 75.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.contenerColor.withOpacity(0.8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: onTap,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.TextColor),
                            width: 60.w,
                            height: 30.h,
                            child: Center(
                                child: ineed.custmText(
                                    data: 'شراء',
                                    fontSize: 15.sp,
                                    fontFamily: 'kufi',
                                    isbold: true)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: double.infinity,
                          height: 30.h,
                          child: Center(
                              child: ineed.custmText(
                                  data: title,
                                  fontSize: 15.sp,
                                  fontFamily: 'kufi',
                                  isbold: true)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 50.w,
                          height: 26.h,
                          child: Center(
                              child: ineed.custmText(
                                  data: price,
                                  fontSize: 15.sp,
                                  fontFamily: 'kufi',
                                  isbold: true)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
