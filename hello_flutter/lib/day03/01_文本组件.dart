import 'package:flutter/material.dart';
//main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JLHomePage(),
    );
  }
}

class JLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础的Widget 控件demo") ,

      ) ,
      body: JLHomeContent(),
    );
  }
}

class JLHomeContent extends StatefulWidget {
  @override
  _JLHomeContentState createState() => _JLHomeContentState();
}

class _JLHomeContentState extends State<JLHomeContent> {
  @override
  Widget build(BuildContext context) {

    return  Text.rich(TextSpan(
//      text: "富文本",
        children: [
          TextSpan(text: "hello world", style: TextStyle(color: Colors.red)),
          TextSpan(text: "hello world", style: TextStyle(color: Colors.green)),
          WidgetSpan(child: Icon(Icons.favorite,color: Colors.red,)),// 图片
          TextSpan(text: "hello world", style: TextStyle(color: Colors.blue)),
        ]
    ));
  }

  Text buildText() {
    return Text(
      "定风波 \n 莫听穿林打叶声，何妨吟啸且徐行。\n 竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。\n 料峭春风吹酒醒，微冷，山头斜照却相迎。回首向来11萧瑟处，归去，也无风雨也无晴\n。",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      textScaleFactor: 0.5,
      style: TextStyle(
        fontSize: 30,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

