import 'package:flutter/material.dart';

class SingleLayoutWidget extends StatefulWidget {
  const SingleLayoutWidget({super.key});

  @override
  _SingleLayoutWidgetState createState() => _SingleLayoutWidgetState();
}

class _SingleLayoutWidgetState extends State<SingleLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("布局单子组件"),),
      body: Column(

        children: [
          Container(
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
          ),
          const PaddingDemo(),
          const AlignDemo()
        ],
      ),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({super.key});


  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text("Padding 间距"),
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
            backgroundColor: Colors.blue,
          ),
        ),
        Text(
          "你好啊，范金龙",
          style: TextStyle(
            fontSize: 30,
            backgroundColor: Colors.yellow,
          ),
        ),
      ],
    );
  }
}

class AlignDemo extends StatelessWidget {
  const AlignDemo({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
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
