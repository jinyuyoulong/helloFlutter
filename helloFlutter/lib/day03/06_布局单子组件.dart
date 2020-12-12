import 'package:flutter/material.dart';

import '01_文本组件.dart';

class _JLHomeContentState extends State<JLHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.red,
      width: 200,
      height: 200,
      alignment: Alignment(0, 0),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: Text("hello world"),
//      transform: Matrix4.rotationZ(100),
//      transform: Matrix4.skew(100,50),
//      transform: Matrix4.rotationZ(100),// 形变
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
              width: 5,
              color: Colors.purple
          ),
//        borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.orange,
              offset: Offset(10, 10),
              spreadRadius: 5,// 偏移量
              blurRadius: 5,// 模糊度
            ),
            BoxShadow(
              color: Colors.blue,
              offset: Offset(-10, 10),
              spreadRadius: 5,// 偏移量
              blurRadius: 5,// 模糊度
            )
          ]
      ),

    );
  }
}

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(// padding 设置间距
//          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),// 垂直，水平
//          padding: const EdgeInsets.fromLTRB(0, 5, 0, 10), // 左上→↓
          padding: const EdgeInsets.only(bottom: 10),// 单独设置一个方位
          child: Text("你好啊，范金龙", style: TextStyle(fontSize: 30, backgroundColor: Colors.red,),),
        ),
        Text("你好啊，范金龙", style: TextStyle(fontSize: 30, backgroundColor: Colors.red,),),
        Text("你好啊，范金龙", style: TextStyle(fontSize: 30, backgroundColor: Colors.red,),),
      ],
    );
  }
}

class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 200,
      width: 200,
      child: Align(// Center 就是Align 的子类
        alignment: Alignment(1,1),
        widthFactor: 5,// 相对于原始Widget的倍数
        heightFactor: 5,
        child: Icon(Icons.pets,size: 50,),
      ),
    );
  }
}