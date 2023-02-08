// ignore_for_file: depend_on_referenced_packages, unused_import, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sumer_market/constns/AppColor.dart';

class startControllor extends GetxController {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  XFile? file2;
  bool isching = false;
  String? temName, teamLogo, bos, loction, mpng;
  List<Map> teamInfo = [];
  List<Map> plerass = [];
    List<Map> plerastodlet = [];

  List docid = [];

  chinglist() {
    isching = !isching;
    update();
  }

  @override
  void onInit() async {
    await FirebaseFirestore.instance.collection('teams').get().then((value) {
      value.docs.forEach((element) {
        teamInfo.add(element.data());
        docid.add(element.id);
      });
    }).then((value) {
      update();
    });
  }

  addAcademy() async {
    var st = form.currentState;
    if (st!.validate() && file2 != null) {
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
        update();
      });
    } else {
      Get.snackbar('انتبه', 'اضف صورة');
    }
  }

  
}
