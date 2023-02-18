import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sumer_market/screens/market/controller/getController.dart';

class costmer extends StatelessWidget {
  const costmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<marketController>(
          init: marketController(),
          builder: (cc) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: cc.custmer.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${cc.custmer[index]['id']}'),
                  ),
                  subtitle: Text(cc.custmer[index]['loction']),
                  title: Text(
                    ' ${cc.custmer[index]['phone']} ---- ${cc.custmer[index]['note']}',
                  ),
                );
              },
            );
          },
        ));
  }
}
