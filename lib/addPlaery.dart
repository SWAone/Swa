import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sumer_market/controllor/addpcontrollor.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sumer_market/main.dart';

class addp extends StatelessWidget {
  String docid;

  addp({super.key, required this.docid});
  @override
  XFile? file;
  String? urll;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: addpcontrollr.keys,
        child: SingleChildScrollView(
          child: GetBuilder<addpcontrollr>(
            init: addpcontrollr(),
            builder: (controller) {
              return Column(
                children: [
                  forma(
                    label: 'الاسم',
                    onSaved: (p0) => controller.name = p0,
                  ),
                  forma(
                    label: 'العمر',
                    onSaved: (p0) => controller.age = p0,
                  ),
                  forma(
                    label: 'محل الولادة',
                    onSaved: (p0) => controller.born = p0,
                  ),
                  forma(
                    label: 'اخر بطولة فاز بها',
                    onSaved: (p0) => controller.cupWin = p0,
                  ),
                  forma(
                    label: 'مكان اقامة البطولة',
                    onSaved: (p0) => controller.cupLoction = p0,
                  ),
                  forma(
                    label: 'تاريخ الفوز باليوم :',
                    onSaved: (p0) => controller.cupday = p0,
                  ),
                  forma(
                    label: 'تاريخ الفوز بالشهر ',
                    onSaved: (p0) => controller.cupmonth = p0,
                  ),
                  forma(
                    label: 'وزن الاعب',
                    onSaved: (p0) => controller.wzn = p0,
                  ),
                  forma(
                    label: 'التقيم',
                    onSaved: (p0) => controller.feddback = p0,
                  ),
                  forma(
                    label: 'من اي مدينة',
                    onSaved: (p0) => controller.from = p0,
                  ),
                  forma(
                    label: 'عدد المباريات التي لعبها',
                    onSaved: (p0) => controller.games = p0,
                  ),
                  forma(
                    label: 'عدد الاهداف',
                    onSaved: (p0) => controller.goal = p0,
                  ),

                  forma(
                    label: 'مكان السكن الحالي',
                    onSaved: (p0) => controller.loction = p0,
                  ),
                  forma(
                    label: 'طول الاعب',
                    onSaved: (p0) => controller.size = p0,
                  ),
                  forma(
                    label: 'المركز',
                    onSaved: (p0) => controller.markz = p0,
                  ),
                  forma(
                    label: 'رابط صورة غير مفرغة',
                    onSaved: (p0) => controller.imag = p0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: (() async {
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
                          urll = await referenceimageUAplod.getDownloadURL();
                          controller.png =
                              await referenceimageUAplod.getDownloadURL();
                          print(urll);
                          controller.png = urll;
                          await controller.uplodData(docId: docid);
                        } catch (e) {}
                      }),
                      child: Text('صورة مفرغة')),
                  // TextButton(
                  //     onPressed: (() async {
                  //       controller.addpng();
                  //     }),
                  //     child: Text('صورة  مفرغة')),

                  // TextButton(
                  //     onPressed: (() async {
                  //                            controller.addimg();
                  //
                  //     }),
                  //     child: controller.isImagUplod? Icon(Icons.done,color: Colors.green,): Text('صورة غير مفرغة')),

                  TextButton(
                      onPressed: (() {
                        controller.uplodData(docId: docid);
                      }),
                      child: Text('تسجيل')),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  static Widget forma(
      {required void Function(String?) onSaved, required String label}) {
    return TextFormField(
      decoration: InputDecoration(label: Text('$label')),
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return "لا يمكن ترك الحقل فارغ";
        }
      },
    );
  }
}
