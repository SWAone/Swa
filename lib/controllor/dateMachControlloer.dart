import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class machController extends GetxController {
  GlobalKey<FormState> formm = new GlobalKey<FormState>();
  String? Ftime, Ltime, time, studem, day;
  List<Map> Allmach = [];
  List machId = [];
  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  getdata() async {
    await FirebaseFirestore.instance.collection('mach').get().then((value) {
      value.docs.forEach((element) {
        Allmach.add(element.data());
        machId.add(element.id);
      });
    }).then((value) {
      update();
    });
  }

  addMach() async {
    var st = formm.currentState;
    if (st!.validate()) {
      st.save();
      await FirebaseFirestore.instance.collection('mach').add({
        "Ftime": Ftime,
        "Ltime": Ltime,
        "studem": studem,
        "time": time,
        "day": day,
      }).then((value) => Get.back());
    }
  }

  dleatmach({required String macId}) async {
    await FirebaseFirestore.instance
        .collection('mach')
        .doc(macId)
        .delete()
        .then((value) {
      Get.back();
    });
  }
}
