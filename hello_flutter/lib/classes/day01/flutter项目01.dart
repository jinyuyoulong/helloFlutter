import 'package:flutter/material.dart';
main() => runApp(const MyApp());

/*
* Widget:
* 有状态Widget：StatefulWidget 在运行过程中有一些状态(data)需要改变
* 无状态Widget: StatelessWidget 内容是确定没有状态(data)的改变的
* */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JLHomePage(),
    );
  }
}

class JLHomePage extends StatelessWidget{
  const JLHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第一个flutter程序"),
      ),
      body:const JLDayOne(),
    );
  }
}

class JLDayOne extends StatelessWidget{
  const JLDayOne({super.key});


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,//主轴
        children: <Widget>[
          Checkbox(
              value: true,
              onChanged: (value){
                print(value);
              }),
          const Text("同意协议")
        ],

      ),
    );
  }
}