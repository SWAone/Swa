import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ineed {
  static Widget custmText(
      {required String data,
      double? fontSize ,
      Color color = Colors.white,
      String fontFamily = 'Cairo',bool isbold=false}) {
    {
      return Text(
        data,
        style:
            TextStyle(fontSize: fontSize, color: color, fontFamily: fontFamily,fontWeight: isbold? FontWeight.bold:FontWeight.normal),
      );
    }
  }
}
