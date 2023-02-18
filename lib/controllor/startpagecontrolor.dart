// ignore_for_file: depend_on_referenced_packages, unused_import, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:sumer_market/screens/startPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class startControllor extends GetxController {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  GlobalKey<FormState> postkey = GlobalKey<FormState>();

  XFile? file2;
  bool isching = false;
  String? temName, teamLogo, bos, loction, mpng;
  List<Map> teamInfo = [];
  List<Map> plerass = [];
  List<Map> posts = [];
  List postId = [];
  List<Map> plerastodlet = [];
  bool lodengUplodImage = false;
  List docid = [];
  final moonLanding = DateTime.parse('1969-07-20 20:18:04Z');
  //   متغيرات البوستات
  String? title, imag;
  chinglist() {
    isching = !isching;
    update();
  }

  @override
  void onInit() async {
    print(moonLanding.day);
    FirebaseMessaging.instance.subscribeToTopic('all');

    await FirebaseFirestore.instance.collection('teams').get().then((value) {
      value.docs.forEach((element) {
        teamInfo.add(element.data());
        docid.add(element.id);
      });
    }).then((value) {
      update();
    });
    await FirebaseFirestore.instance
        .collection('vrsion')
        .doc('vir')
        .get()
        .then((value) {
      if (value.data()!['v'] != 1) {
        AwesomeDialog(
          dismissOnTouchOutside: false,
          context: Get.context!,
          dialogType: DialogType.info,
          animType: AnimType.bottomSlide,
          title: 'انت تستخدم اصدار قديم',
          desc: 'قم بطلب الاصدار الاخير من الشخص المسؤال عن التطبيق',
        ).show();
        update();
      }

      update();
    });

    await FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        posts.add(element.data());
        postId.add(element.id);
      });
    }).then((value) {
      update();
    });
  }

  void AddPost() async {
    var sta = postkey.currentState;
    if (sta!.validate()) {
      sta.save();
      await FirebaseFirestore.instance
          .collection('posts')
          .add({"title": title, "imag": imag}).then((value) {
        Get.back();
        update();
      });
    }
  }

  void dletPost({required String docidd}) async {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(docidd)
        .delete()
        .then((value) {
      Get.back();
      Get.snackbar('تم الحذف', 'اعد تشغيل التطبيق للتحديث');
    });
  }

  void dlet({required String docid}) async {
    await FirebaseFirestore.instance
        .collection('teams')
        .doc(docid)
        .delete()
        .then((value) {
      update();
      Get.to(() => startPage());
    });
  }

  addAcademy() async {
    var st = form.currentState;
    if (st!.validate() && file2 != null && lodengUplodImage) {
      lodengUplodImage = false;
      Get.snackbar('انتضر قليلا', 'جار الاضافة', colorText: AppColor.TextColor);
      st.save();
      await FirebaseFirestore.instance.collection('teams').add({
        "TL": teamLogo,
        "TN": temName,
        "bos": bos,
        "loction": loction,
        "mpng": mpng,
      }).then((value) {
        Get.snackbar('تم', 'تم اضافة الفريق', colorText: AppColor.TextColor);
        Get.to(() => startPage());
        update();
      });
    } else {
      Get.snackbar('انتضر', 'جار تحميل الصورة');
    }
  }
}
