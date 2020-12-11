import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
main() => runApp(MyApp());

/*
* Widget:
* 有状态Widget：StatefulWidget 在运行过程中有一些状态(data)需要改变
* 无状态Widget: StatelessWidget 内容是确定没有状态(data)的改变的
* */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JLHomePage(),
    );
  }
}

class JLHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个flutter程序"),
      ),
      body:JLContentBody(),
    );
  }
}

class JLContentBody extends StatelessWidget{

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
          Text("同意协议")
        ],

      ),
    );
  }
}