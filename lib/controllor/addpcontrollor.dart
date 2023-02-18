import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class addpcontrollr extends GetxController {
  static GlobalKey<FormState> keys = GlobalKey<FormState>();
  XFile? file;

  String? name,
      age,
      born,
      cupWin,
      feddback,
      from,
      games,
      goal,
      imag,
      loction,
      markz,
      png,
      size,
      cupday,
      cupmonth,
      cupLoction,
      wzn;

  bool isPngUplod = false, isImagUplod = false;
  uplodData({required String docId}) async {
    var st = keys.currentState;
    if (st!.validate()) {
      if (png != null) {
        print('object');
        st.save();
        await FirebaseFirestore.instance
            .collection('teams')
            .doc(docId)
            .collection('players')
            .add({
          "name": name,
          "age": age,
          "born": born,
          "cupWin": cupWin,
          "feddback": feddback,
          "from": from,
          "games": games,
          "goal": goal,
          "imag": imag,
          "loction": loction,
          "markz": markz,
          "png": png,
          "size": size,
          "cupday": cupday,
          "cupmonth": cupmonth,
          "cupLoction": cupLoction,
          "wzn": wzn
        }).then((value) {
          Get.back();
        });
      } else {
        Get.snackbar('تمهل', 'انتضر قليلا جار رفع الصورة');
      }
    } else {
      Get.snackbar('انتبه', 'يجب ادخال جميع الحقول');
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
}
