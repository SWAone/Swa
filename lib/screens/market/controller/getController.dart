import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sumer_market/addPlaery.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:sumer_market/widget/custmContener.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class marketController extends GetxController {
  List<Map> prodect = [];
  List<Map> custmer = [];
  List docId = [];
  GlobalKey<FormState> form = new GlobalKey<FormState>();
  GlobalKey<FormState> form2 = new GlobalKey<FormState>();
  bool lodeng = false;
  int zaboon = 0;
  String? price, title, imag, ProdectIdd;
  // الزبون
  String? loction, phone, note, ProdectId;
  getData() async {
    await FirebaseFirestore.instance
        .collection('market')
        .get()
        .then((value) => value.docs.forEach((element) {
              prodect.add(
                element.data(),
              );
              docId.add(element.id);
            }))
        .then((value) {
      update();
    });
  }

  addProdect() async {
    var statee = form.currentState;
    if (statee!.validate()) {
      statee.save();
      await FirebaseFirestore.instance.collection('market').add({
        "price": price,
        "title": title,
        "imag": imag,
        "id": ProdectIdd
      }).then((value) {
        update();
        Get.back();
      });
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
    requst();
  }

  void requst() async {
    await FirebaseFirestore.instance.collection('mony').get().then((value) {
      zaboon = value.docs.length;
      value.docs.forEach(
        (element) {
          custmer.add(element.data());
        },
      );
      update();
    });
  }

  bayProdect({required String docid}) async {
    Get.defaultDialog(
        title: 'شراء عنصر',
        content: Form(
          key: form2,
          child: Column(
            children: [
              addp.forma(onSaved: (p0) => loction = p0, label: 'موقعك'),
              addp.forma(onSaved: (p0) => phone = p0, label: 'رقم الهاتف'),
              addp.forma(onSaved: (p0) => note = p0, label: 'الملاحظات'),
              SizedBox(
                height: 15.h,
              ),
              custemCountener(
                onTap: () async {
                  var stat = form2.currentState;
                  if (stat!.validate()) {
                    await FirebaseFirestore.instance
                        .collection('market')
                        .doc(docid)
                        .get()
                        .then((value) {
                      ProdectId = value.data()!['id'];
                    });

                    stat.save();
                    await FirebaseFirestore.instance.collection('mony').add(
                      {
                        "phone": phone,
                        "loction": loction,
                        "note": note,
                        "id": ProdectId
                      },
                    );
                    Get.back();
                    Get.defaultDialog(
                        titleStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'kufi',
                            fontSize: 20.sp),
                        title: 'شكرا لك',
                        content: ineed.custmText(
                            data:
                                'سيتم الاتصال بك باسرع وقت لاتمام عملية الشراء',
                            color: Colors.black,
                            fontFamily: 'kufi',
                            fontSize: 20.sp));
                    Get.back();
                    Get.defaultDialog(
                        titleStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'kufi',
                            fontSize: 20.sp),
                        title: 'شكرا لك',
                        content: ineed.custmText(
                            data:
                                'سيتم الاتصال بك باسرع وقت لاتمام عملية الشراء',
                            color: Colors.black,
                            fontFamily: 'kufi',
                            fontSize: 20.sp));
                    requst();
                  }
                },
                text: 'ارسال الطلب',
                color: AppColor.TextColor,
              )
            ],
          ),
        ));
  }
}
