import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "app title",
      home: JLHomePage(),
    );
  }
}

class JLHomePage extends StatelessWidget {
  const JLHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("基础Widget"),
      ),
      body: const JLHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => print("浮动按钮"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class JLHomeContent extends StatefulWidget {
  const JLHomeContent({super.key});

  @override
  _JLHomeContentState createState() => _JLHomeContentState();
}

class _JLHomeContentState extends State<JLHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.red,
      width: 200,
      height: 200,
      alignment: const Alignment(0, 0),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
//      transform: Matrix4.rotationZ(100),
//      transform: Matrix4.skew(100,50),
//      transform: Matrix4.rotationZ(100),// 形变
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(width: 5, color: Colors.purple),
//        borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              color: Colors.orange,
              offset: Offset(10, 10),
              spreadRadius: 5, // 偏移量
              blurRadius: 5, // 模糊度
            ),
            BoxShadow(
              color: Colors.blue,
              offset: Offset(-10, 10),
              spreadRadius: 5, // 偏移量
              blurRadius: 5, // 模糊度
            )
          ]),
      child: const Text("hello world"),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Padding(
          // padding 设置间距
//          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),// 垂直，水平
//          padding: const EdgeInsets.fromLTRB(0, 5, 0, 10), // 左上→↓
          padding: EdgeInsets.only(bottom: 10), // 单独设置一个方位
          child: Text(
            "你好啊，范金龙",
            style: TextStyle(
              fontSize: 30,
              backgroundColor: Colors.red,
            ),
          ),
        ),
        Text(
          "你好啊，范金龙",
          style: TextStyle(
            fontSize: 30,
            backgroundColor: Colors.red,
          ),
        ),
        Text(
          "你好啊，范金龙",
          style: TextStyle(
            fontSize: 30,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}

class AlignDemo extends StatelessWidget {
  const AlignDemo({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 200,
      width: 200,
      child: const Align(
        // Center 就是Align 的子类
        alignment: Alignment(1, 1),
        widthFactor: 5, // 相对于原始Widget的倍数
        heightFactor: 5,
        child: Icon(
          Icons.pets,
          size: 50,
        ),
      ),
    );
  }
}
