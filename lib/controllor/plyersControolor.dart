import 'dart:math';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class plerasControolor extends GetxController {
  plerasControolor({required this.docid});
  List<Map> pllyers = [];
  List playersID = [];
  static bool isfinsh = false;
  String docid;

  @override
  void onInit() async {
    // TODO: implement onInit
    await FirebaseFirestore.instance
        .collection('teams')
        .doc(docid)
        .collection('players')
        .get()
        .then((value) => value.docs.forEach((element) {
              pllyers.add(element.data());
              playersID.add(element.id);
            }))
        .then((value) {
      update();
      isfinsh = true;
    });
  }

  dletplayers({required String pleersId}) async {
    await FirebaseFirestore.instance
        .collection('teams')
        .doc(docid)
        .collection('players')
        .doc(pleersId)
        .delete()
        .then((value) {
      update();
      Get.back();
    });
  }
}
