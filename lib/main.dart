import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sumer_market/control.dart';
import 'package:sumer_market/screens/market/marketScreen.dart';
import 'package:sumer_market/screens/startPage.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      builder: (context, child) {

        return GetMaterialApp(
        
          textDirection: TextDirection.rtl,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
        
          primarySwatch: Colors.blue,
        ),
        home: const startPage(),
      );
  });
  }
}
b(){
}

      
      