import 'package:flutter/material.dart';
import 'package:hello_flutter/classes/douban/pages/main/main.dart';

class DouBanHomePage extends StatelessWidget {
  const DouBanHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const JLMainPage();
    //   MaterialApp(
    //   title: "豆瓣",
    //   // debugShowCheckedModeBanner: false,// 取消 debug tag
    //   theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //       splashColor: Colors.transparent,
    //     highlightColor: Colors.transparent,// 取消所有按钮的按住高亮效果。设置为透明
    //   ),
    //   home: const JLMainPage(),
    // );
  }
}
