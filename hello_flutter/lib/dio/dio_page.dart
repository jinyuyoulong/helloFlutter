import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/getx/counter_get/view.dart';
import 'package:hello_flutter/service/http_echo_model.dart';
import 'package:hello_flutter/service/http_request.dart';

class JLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio网络请求"),
      ),
      body: JLContentBody(),
    );
  }
}

class JLContentBody extends StatefulWidget {
  @override
  _JLContentBodyState createState() => _JLContentBodyState();
}

class _JLContentBodyState extends State<JLContentBody> {
  @override
  void initState() {
    super.initState();
    // dio请求
    // 1.创建dio
    // final dio = Dio();
    // 发起请求
    // 推荐这个测试网址
    // dio.get("https://httpbin.org/get").then((value) {
    //   print(value);
    // });
    // dio.post("https://httpbin.org/post").then((value) {
    //   print(value);
    // });
    // 真实开发是：参数-> 拦截器(封装)
//    只要用到第三方库，建议都做一层封装
    HttpRequest.request("https://httpbin.org/get", parames: {"name": "any"},
        inter: InterceptorsWrapper(onRequest: (request, handler) {
          return handler.next(request);
        })).then((value) {
      print("==json==");
      print(value);
      print("type of value ${value.runtimeType}");
      //输出第一个用户的姓名
      print(value["origin"]);
      // json转模型
      var model = HttpEchoModel.fromJson(value);
      print(model.url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterGetPage();
  }
}
