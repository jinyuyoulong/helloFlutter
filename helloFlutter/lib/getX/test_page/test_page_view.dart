import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'test_page_logic.dart';
// GetX 教程
// https://segmentfault.com/a/1190000039139198
class TestPagePage extends StatelessWidget {
  final logic = Get.put(TestPageLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX 计数器'),),
      body: Center(
        child: GetBuilder<TestPageLogic>(builder: (logic){
          return Text(
            '点击了 ${logic.count} 次',
            style: TextStyle(fontSize: 30.0),
          );
        },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increate(),
        child: Icon(Icons.add),
      ),
    );
  }
}
