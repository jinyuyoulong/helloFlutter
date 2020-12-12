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

class JLHomePage extends StatefulWidget{
  @override
  _JLHomePageState createState() => _JLHomePageState();
}

class _JLHomePageState extends State<JLHomePage> {
  @override
  Widget build(BuildContext context) {
    /*
  * 监听ListView的滚动有两种方式：
  * 1. 通过controller，会有一些限制,一般用controller的类是StatefulWidget
  * 2. NotificationListener
  * */
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter程序"),
      ),
      body: ListView.builder(
        controller: ,
          itemBuilder: (BuildContext ctx, int index) {
            return ListTile(
              leading: Icon(Icons.mail),
              title: Text("邮箱 $index"),
            );
          }
      ),
    );
  }
}