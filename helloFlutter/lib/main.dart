import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
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
        title: Text("Dio网络请求"),
      ),
      body:JLContentBody(),
    );
  }
}

class JLContentBody extends StatefulWidget{

  @override
  _JLContentBodyState createState() => _JLContentBodyState();
}

class _JLContentBodyState extends State<JLContentBody> {
  @override
  void initState() {
    super.initState();
    // dio请求
    // 1.创建dio
    final dio = Dio();
    // 发起请求
    // 推荐这个测试网址
    dio.get("https://httpbin.org/get").then((value){
      print(value);
    });
    dio.post("https://httpbin.org/post").then((value){
      print(value);
    });
    // 真实开发是：参数-> 拦截器(封装)
//    只要用到第三方库，建议都做一层封装
  }
  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}