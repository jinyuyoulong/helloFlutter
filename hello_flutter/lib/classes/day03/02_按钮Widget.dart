import 'package:flutter/material.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  _ButtonsPageState createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buttons"),),
      body: Column(
        children: <Widget>[
          // 1. ElevatedButton
          ElevatedButton(
            style: ButtonStyle(
              // foregroundColor: MaterialStateProperty.all(Colors.grey),
                backgroundColor: WidgetStateProperty.all(Colors.grey),
                textStyle: WidgetStateProperty.all(const TextStyle(color: Colors.white))
            ),
            onPressed: ()=> print("dd"),
            child: const Text("ElevatedButton 高地按钮"),
          ),
          // TextButton
          TextButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.orange)
            ),
            child: const Text("平坦的Flat 按钮 TextBtn"),
            onPressed: ()=>print("flat click"),
          ),
          // OutlineButton 边框按钮
          OutlinedButton(
            child: const Text("Outline button 边框按钮"),
            onPressed: ()=>print("边框按钮"),
          ),
          // 4. floatingActionButton 浮动按钮
          // 5. 自定义button：图标-文字-背景-圆角
          TextButton(
            style: ButtonStyle(shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            )),
                backgroundColor: WidgetStateProperty.all(Colors.purple)),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.favorite,color: Colors.red,),
                Text("love范")
              ],
            ),
            onPressed: (){},
          )
        ],
      ),
    );


  }
}


