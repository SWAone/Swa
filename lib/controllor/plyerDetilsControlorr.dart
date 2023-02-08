import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class plyerDetilsControlorr extends GetxController {
  String docId, playersID;
  bool istrue=false;
  String? name, size, imag, age,temlogo, from, born, feedback,cupWin,games,goal,markz,png,wzn,cupmonth,cupday,cupLoction;
  plyerDetilsControlorr({required this.docId, required this.playersID});


  @override
  void onInit() async {
    await FirebaseFirestore.instance.collection('teams').doc(docId).get().then((value) => temlogo=value.data()?['TL']);

    // TODO: implement onInit
    await FirebaseFirestore.instance
        .collection('teams')
        .doc(docId)
        .collection('players')
        .doc(playersID)
        .get()
        .then((value) {
      name = value.data()!['name'];
      age = value.data()!['age'];
      born = value.data()!['born'];
      feedback = value.data()!['feddback'];


      from = value.data()!['from'];
      cupWin = value.data()!['cupWin'];
      games = value.data()!['games'];
      goal = value.data()!['goal'];
      markz= value.data()!['markz'];

  

         imag = value.data()!['imag'];

         png = value.data()!['png'];
             size = value.data()!['size'];
         wzn = value.data()!['wzn'];

  cupmonth = value.data()!['cupmonth'];
             cupday = value.data()!['cupday'];
         cupLoction = value.data()!['cupLoction'];
         
  update();
    }).then((value) { istrue=true;} );

  }

   
        
}
