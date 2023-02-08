import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';


class addpcontrollr extends GetxController {
 static GlobalKey<FormState> keys=GlobalKey<FormState>();
 XFile? file;
  XFile? file2;
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

  bool isPngUplod=false,isImagUplod=false;
  uplodData({required String docId}) async {
    var st=keys.currentState;
    if (st!.validate() && file!=null && file2!=null) {
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
      "cupday":cupday,
      "cupmonth":cupmonth,
      "cupLoction":cupLoction,
            "wzn":wzn

    });
    }else{
      Get.snackbar('انتبه', 'لايمكن تسجيل الاعب بدون صورة');
    }
   
  }
  @override
  void onInit()async {
    // TODO: implement onInit
    super.onInit();
  }

  addpng()async{
    isPngUplod=false;
ImagePicker imagePicker = ImagePicker();
                       file2 = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        print(file2!.path);
                        if (file2 == null) return;
                        String UineqFileNmaw =
                            DateTime.now().microsecondsSinceEpoch.toString();
                        Reference referenceRote =
                            FirebaseStorage.instance.ref();
                        Reference referenceDirimage =
                            referenceRote.child('image');
                        Reference referenceimageUAplod =
                            referenceDirimage.child(UineqFileNmaw);
                        try {
                          await referenceimageUAplod.putFile(File(file2!.path));
                         png = await referenceimageUAplod.getDownloadURL().then((value) {isPngUplod=!isPngUplod;print('uplllllod');update();});
                             
                        } catch (e) {}
  }

  addimg()async{
    isImagUplod=false;
ImagePicker imagePicker = ImagePicker();
                       file = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        print(file!.path);
                        if (file == null) return;
                        String UineqFileNmaw =
                            DateTime.now().microsecondsSinceEpoch.toString();
                        Reference referenceRote =
                            FirebaseStorage.instance.ref();
                        Reference referenceDirimage =
                            referenceRote.child('image');
                        Reference referenceimageUAplod =
                            referenceDirimage.child(UineqFileNmaw);
                        try {
                          await referenceimageUAplod.putFile(File(file!.path));
                         imag = await referenceimageUAplod.getDownloadURL().then((value) {isImagUplod=!isImagUplod;print('uplllllod');update();});
                             
                        } catch (e) {}
  }
  
}
