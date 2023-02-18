import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumer_market/addPlaery.dart';
import 'package:sumer_market/constns/AppColor.dart';
import 'package:sumer_market/controllor/startpagecontrolor.dart';
import 'package:sumer_market/ineed/ineed.dart';
import 'package:sumer_market/widget/taemsContener.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class controlPage extends StatelessWidget {
  const controlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
      ),
      body: GetBuilder<startControllor>(
        init: startControllor(),
        builder: (cc) {
          return Column(children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.contenerColor2,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    onPressed: () {
                      Get.defaultDialog(
                          title: 'اضافة نادي',
                          content: Form(
                            key: cc.form,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  addp.forma(
                                      onSaved: (p0) => cc.temName = p0,
                                      label: 'اسم النادي'),
                                  addp.forma(
                                      onSaved: (p0) => cc.bos = p0,
                                      label: 'مدرب الفريق'),
                                  addp.forma(
                                      onSaved: (p0) => cc.loction = p0,
                                      label: 'محافظة الفريق'),
                                  addp.forma(
                                      onSaved: (p0) => cc.mpng = p0,
                                      label: 'رابط صورة المدرب'),

                                  TextButton(
                                      onPressed: (() async {
                                        ImagePicker imagePicker = ImagePicker();
                                        cc.file2 = await imagePicker.pickImage(
                                            source: ImageSource.gallery);
                                        print(cc.file2!.path);
                                        if (cc.file2 == null) return;
                                        String UineqFileNmaw = DateTime.now()
                                            .microsecondsSinceEpoch
                                            .toString();
                                        Reference referenceRote =
                                            FirebaseStorage.instance.ref();
                                        Reference referenceDirimage =
                                            referenceRote.child('image');
                                        Reference referenceimageUAplod =
                                            referenceDirimage
                                                .child(UineqFileNmaw);
                                        try {
                                          await referenceimageUAplod
                                              .putFile(File(cc.file2!.path))
                                              .then((p0) {
                                            cc.lodengUplodImage = true;
                                            Get.defaultDialog(
                                                title: 'تم تحميل الصورة ',
                                                content: Icon(
                                                  Icons.done,
                                                  color: Colors.green,
                                                ));
                                          });
                                          cc.teamLogo =
                                              await referenceimageUAplod
                                                  .getDownloadURL();
                                        } catch (e) {}
                                      }),
                                      child: Text('صورة شعار النادي مفرغه ')),
                                  //   TextButton(
                                  // onPressed: (() async {
                                  //                         ImagePicker imagePicker = ImagePicker();
                                  //                         cc. file2 = await imagePicker.pickImage(
                                  //   source: ImageSource.gallery);
                                  //                         print(cc.file2!.path);
                                  //                         if (cc.file2 == null) return;
                                  //                         String UineqFileNmaw =
                                  //   DateTime.now().microsecondsSinceEpoch.toString();
                                  //                         Reference referenceRote =
                                  //   FirebaseStorage.instance.ref();
                                  //                         Reference referenceDirimage =
                                  //   referenceRote.child('image');
                                  //                         Reference referenceimageUAplod =
                                  //   referenceDirimage.child(UineqFileNmaw);
                                  //                         try {
                                  // await referenceimageUAplod.putFile(File(cc.file2!.path));
                                  // cc.mpng = await referenceimageUAplod.getDownloadURL();
                                  //
                                  //                         } catch (e) {}
                                  //                       }),
                                  //                       child: Text('صورة المدرب مفرغه')),

                                  TextButton(
                                    onPressed: () {
                                      cc.addAcademy();
                                    },
                                    child: Text('اضافة'),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                    child:
                        ineed.custmText(data: 'اضافة نادي', fontSize: 15.sp))),
            SizedBox(
              height: 20.h,
            ),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 5.h,
              ),
              itemCount: cc.teamInfo.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return temsContener(
                    onTap: () {
                      Get.defaultDialog(
                          content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              onPressed: () {
                                cc.dlet(docid: cc.docid[index]);
                                cc.update();
                              },
                              child: Text('حذف الفريق')),
                          TextButton(
                              onPressed: () {
                                Get.to(() => addp(
                                      docid: cc.docid[index],
                                    ));
                              },
                              child: Text('اضافة لاعب'))
                        ],
                      ));
                    },
                    png: cc.teamInfo[index]['TL'],
                    name: cc.teamInfo[index]['TN'],
                    iscontrol: true);
              },
            )
          ]);
        },
      ),
    );
  }
}
// 