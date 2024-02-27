import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/service/http_request.dart';
/*
* Widget:
* 有状态Widget：StatefulWidget 在运行过程中有一些状态(data)需要改变
* 无状态Widget: StatelessWidget 内容是确定没有状态(data)的改变的
* */
class DioNetworkDemo extends StatelessWidget {
  const DioNetworkDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dio网络请求"),
      ),
      body: const JLContentBody(),
    );
  }
}

class JLContentBody extends StatefulWidget {
  const JLContentBody({super.key});

  @override
  _JLContentBodyState createState() => _JLContentBodyState();
}

class _JLContentBodyState extends State<JLContentBody> {
  final Dio _dio = Dio();
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
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _dio.get("https://httpbin.org/get"),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          // 请求完成
          if (snapshot.connectionState == ConnectionState.done) {
            Response response = snapshot.data;
            //发生错误
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Text(response.data.toString());
          }
          //请求未完成时弹出loading
          return const CircularProgressIndicator();
        });
  }
}
