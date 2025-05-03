import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MallPage extends StatelessWidget {
  MallPage({Key? key}) : super(key: key);

  final logic = Get.put(MallLogic());

  @override
  Widget build(BuildContext context) {
    return const Text("Mall");
  }
}
