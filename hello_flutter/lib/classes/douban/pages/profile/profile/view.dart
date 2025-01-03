import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final logic = Get.put(ProfileLogic());

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("我的"),);
  }
}
