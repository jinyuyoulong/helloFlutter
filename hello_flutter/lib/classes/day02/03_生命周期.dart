import 'package:flutter/material.dart';

main()=>runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JLHomePage(),
    );
  }
}

class JLHomePage extends StatefulWidget {
  const JLHomePage({super.key});


  @override
  _JLHomePageState createState() => _JLHomePageState();
}

class _JLHomePageState extends State<JLHomePage> {
  @override
  Widget build(BuildContext context) {
    return const JLHomeDemo();
  }
}
class JLHomeDemo extends StatefulWidget {
  const JLHomeDemo({super.key});

  @override
  _JLHomeDemoState createState() => _JLHomeDemoState();
}

class _JLHomeDemoState extends State<JLHomeDemo> {
  List<Widget> widgets = [JLHomeContent()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( "商品列表"),
      ),
      body: buildColumn(),
      floatingActionButton: ElevatedButton(
          child: const Icon(Icons.add),
          onPressed: (){
            setState(() {
//              widgets.insert(0,Text("data"));
            });

          }),
    );
  }
// alt+cmd+M 抽取代码成widget
  Column buildColumn() {
    return Column(
      children: [JLHomeContent()],
    );
  }
  @override
  void didUpdateWidget(JLHomeDemo oldWidget) {
    print("调用了JLHomeDemoState中的 didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
}

//Widget 不加下划线，一般暴露给外部使用。
//State 是加下划线，状态类，只给Widget内部使用
//class JLHomeContent extends StatelessWidget {
//  final String message;
//  JLHomeContent(this.message){
//    print("构造函数被调用");
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    print("调用build方法");
//    return Text(message);
//  }
//}

class JLHomeContent extends StatefulWidget {
  JLHomeContent({super.key}){
    print("1.调用JLHomeContent的constructor");
  }
  @override
  _JLHomeContentState createState() {
    print("2.调用JLHomeContent的createState方法");
    return _JLHomeContentState();

  }
}

class _JLHomeContentState extends State<JLHomeContent> {
  int _countter = 0;
  _JLHomeContentState(){
    print("3.调用_JLHomeContentState的constructor方法");
  }
  @override
  void initState() {
    print("4. 调用State的initState方法");
    // 这里必须调super
    super.initState();

  }

  @override
  void didUpdateWidget(JLHomeContent oldWidget) {
    print("调用了JLHomeContentState中的 didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
//    inhertedWidget中共享状态的时候再讲这个方法的使用。
    print("调用了State中的didChangeDependencies");
  }
  @override
  Widget build(BuildContext context) {
    print("5. 调用build ");
    return Column(
      children: <Widget>[
        ElevatedButton(
            child: const Icon(Icons.add),
            onPressed: (){
//            setState之后自动标记需要重新build，这就是为什么状态更新为什么必须在setState中
              setState(() {
                _countter ++;
              });
            }),
        Text("数字$_countter"),

      ],
    );
  }

  @override
  void dispose() {
    print("6.调用State的dispose方法");
    super.dispose();
  }
}
