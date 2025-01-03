import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GroupPage extends StatelessWidget {
  GroupPage({Key? key}) : super(key: key);

  final logic = Get.put(GroupLogic());

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("小组"),);
  }
}
