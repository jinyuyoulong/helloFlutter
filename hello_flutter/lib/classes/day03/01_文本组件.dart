import 'package:flutter/material.dart';
class TextViewPage extends StatelessWidget {
  const TextViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text 组件"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text.rich(TextSpan(
//      text: "富文本",
              children: [
                TextSpan(
                    text: "hello world", style: TextStyle(color: Colors.red)),
                TextSpan(
                    text: "hello world", style: TextStyle(color: Colors.green)),
                WidgetSpan(child: Icon(Icons.favorite, color: Colors.red,)), // 图片
                TextSpan(
                    text: "hello world", style: TextStyle(color: Colors.blue)),
              ]
          )),
          buildText()
        ],
      ),
    );

  }

  Text buildText() {
    return const Text(
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
