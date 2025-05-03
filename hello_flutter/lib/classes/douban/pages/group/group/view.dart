import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GroupPage extends StatelessWidget {
  GroupPage({super.key});

  final logic = Get.put(GroupLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("小组"),
      padding: EdgeInsets.all(3),
    );
  }
}
