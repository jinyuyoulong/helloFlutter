import 'package:flutter/material.dart';
main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app title",
      home: JLHomePage(),
    );
  }
}
class JLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础Widget"),
      ),
      body: ButtonsPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>print("浮动按钮"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
class ButtonsPage extends StatefulWidget {
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
            child: Text("ElevatedButton 高地按钮"),
            style: ButtonStyle(
              // foregroundColor: MaterialStateProperty.all(Colors.grey),
                backgroundColor: MaterialStateProperty.all(Colors.grey),
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white))
            ),
            onPressed: ()=> print("dd"),
          ),
          // TextButton
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange)
            ),
            child: Text("平坦的Flat 按钮"),
            onPressed: ()=>print("flat click"),
          ),
          // OutlineButton 边框按钮
          OutlinedButton(
            child: Text("Outline button 边框按钮"),
            onPressed: ()=>print("边框按钮"),
          ),
          // 4. floatingActionButton 浮动按钮
          // 5. 自定义button：图标-文字-背景-圆角
          TextButton(
            style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            )),
                backgroundColor: MaterialStateProperty.all(Colors.purple)),
            child: Row(
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


