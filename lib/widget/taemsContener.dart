import 'package:flutter/material.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:sumer_market/widget/custmContener.dart';
import 'package:sumer_market/widget/startContener.dart';
import 'package:sumer_market/widget/taemsContener.dart';

class temsContener extends StatelessWidget {
  temsContener(
      {super.key,
      required this.name,
      required this.png,
      this.onTap,
      this.isHaeDleteButun = false,
      this.iscontrol = false});
  String name;
  String png;
  bool iscontrol;
  bool isHaeDleteButun;

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return StartContener(
      onTap: onTap,
      height: 50.h,
      width: 270.w,
      color: AppColor.contenerColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    width: 50.w,
                    height: 35.h,
                    child: Image(
                      image: NetworkImage(png),
                    )),
                ineed.custmText(data: name, fontSize: 20.sp),
              ],
            ),
            custemCountener(
              text: iscontrol ? 'اضافه لاعب' : 'التفاصيل',
              fontSize: 15.sp,
              TextColor: Colors.white,
              width: iscontrol ? 100.w : 70.w,
              height: 30.h,
              color: AppColor.TextColor,
            ),
          ],
        ),
      ),
    );
  }
}
