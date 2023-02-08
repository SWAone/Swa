import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class marketController extends GetxController {
  List<Map> prodect = [];

  getData() async {
    await FirebaseFirestore.instance
        .collection('market')
        .get()
        .then((value) => value.docs.forEach((element) {
              prodect.add(
                element.data(), 
              );
            })).then((value) {update();});
  }
  @override
  void onInit() {
getData();
    super.onInit();
  }
}
