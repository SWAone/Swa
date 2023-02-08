import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sumer_market/controllor/addpcontrollor.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sumer_market/main.dart';

class addp extends StatelessWidget {
  String docid;
  addp({super.key,required this.docid});
  @override
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
                  SizedBox(
                    height: 10,
                  ),

                   TextButton(
                      onPressed: (() async {
                        
                        controller.addpng();
                      }),
                      child:controller.isPngUplod? Icon(Icons.done,color: Colors.green,):  Text('صورة  مفرغة')),


                  TextButton(
                      onPressed: (() async {
                                             controller.addimg();

                      }),
                      child: controller.isImagUplod? Icon(Icons.done,color: Colors.green,): Text('صورة غير مفرغة')),


                  TextButton(
                      onPressed: (() {
                        if (controller.isImagUplod && controller.isPngUplod) {
                                                  controller.uplodData(docId: docid);

                        }else{
                          Get.snackbar('حمل الصور', 'انتضر العلامة الخضراء');
                        }
                      }),
                      child:  Text('تسجيل')),
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
          return "فارغ";
        }
      },
    );
  }
}
