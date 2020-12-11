// 一个dart文件就是一个库，即使没有用library关键字声明

// 1. 使用系统的库 import "dart:库的名字";
// 2. 使用自定义的库 import "utils/math.dart" as m_math;
// as 给库起别名
// 默认导入所有的公共方法和属性
// show 执行要导入的内容
// hide隐藏某个导入的内容，导入其他内容

// 4. export 抽取公共库头文件
// 5. 下划线用来区分公共库方法和私有库方法
// 6. 使用第三方的库文件 pubspec.yaml import "package:http/http.dart"
/*
name: demo
description: 一个库
dependencies: 
    http: ^0.12.2

*/
// pub get

import 'dart:math';

main(List<String> args) {
  final a = 20;
  final b = 30;
  print(min(a, b));
}
