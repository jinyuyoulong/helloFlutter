import 'package:flutter/material.dart';

main()=>runApp(MyApp());
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
        title: Text( "商品列表"),
      ),
      body: JLHomeContent("haha"),
    );
  }
}

//Widget 不加下划线，一般暴露给外部使用。
//State 是加下划线，状态类，只给Widget内部使用
class JLHomeContent extends StatefulWidget {
  final String message;
  JLHomeContent(this.message);

  @override
  _JLHomeContentState createState() => _JLHomeContentState();
}

/*
* 为什么flutter在设计的时候StatefulWidget的build方法放在State中
* 1. build出来的Widget是需要依赖State中的变量（状态/数据)
* 2. 在Flutter的运行过程中：
*     Widget是不断地额销毁和创建的
*     当我们自己的状态发生改变时，并不希望重新创建一个新的State
* */
class _JLHomeContentState extends State<JLHomeContent> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,//主轴居中
        children: <Widget>[
          _getButtons(),
          Text("当前计数:$_counter",style: TextStyle(fontSize: 25),),
          Text("传过来的信息:${widget.message}",)
        ],
      ),
    );
  }

  Widget _getButtons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            child: Text("+", style: TextStyle(fontSize: 20, color: Colors.white),),
            color: Colors.red,
            onPressed: (){
              setState(() {
//                相当于匿名函数，这里，外边设置++也可以
                _counter ++;
              });
            }),
        RaisedButton(
            child: Text("-",style: TextStyle(fontSize: 20, color: Colors.white)),
            color: Colors.blue,
            onPressed: (){
              setState(() {
                _counter --;
              });

            }),
      ],
    );
  }
}
