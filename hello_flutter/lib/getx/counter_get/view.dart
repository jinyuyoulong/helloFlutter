import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CounterGetPage extends StatelessWidget {
  CounterGetPage({Key? key}) : super(key: key);

  final logic = Get.put(CounterGetLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('计数器getx'),),
      body: Center(
        /*
        * Obx()方法刷新的条件
只有当响应式变量的值发生变化时，才会会执行刷新操作，当某个变量初始值为：“test”，再赋值为：“test”，并不会执行刷新操作
当你定义了一个响应式变量，该响应式变量改变时，包裹该响应式变量的Obx()方法才会执行刷新操作，其它的未包裹该响应式变量的Obx()方法并不会执行刷新操作，Cool！
* * */
        child: Obx(() {
          return Text(
            '点击了${logic.count}次',
            style: const TextStyle(fontSize: 30.0),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
