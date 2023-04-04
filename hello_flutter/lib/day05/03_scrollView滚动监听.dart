import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

main() => runApp(MyApp());

/*
* Widget:
* 有状态Widget：StatefulWidget 在运行过程中有一些状态(data)需要改变
* 无状态Widget: StatelessWidget 内容是确定没有状态(data)的改变的
* */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JLHomePage(),
    );
  }
}

class JLHomePage extends StatefulWidget {
  @override
  _JLHomePageState createState() => _JLHomePageState();
}

class _JLHomePageState extends State<JLHomePage> {
  /*
  * controller
  * 1. 可以设置默认offset
  * 2. 监听滑动，也可以监听默认位置
  * NotificationListener，本质是一个Widget
  * 1. 监听开始滑动和结束滑动
  *
  * */
  ScrollController _controller = ScrollController(initialScrollOffset: 300);
  bool _isShowFloatingBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print("监听到滚动。。。");
      setState(() {
        _isShowFloatingBtn = _controller.offset >= 1000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /*
  * 监听ListView的滚动有两种方式：
  * 1. 通过controller，会有一些限制,一般用controller的类是StatefulWidget
  * 2. NotificationListener
  * */
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter程序"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          print("notification 监听到滚动。。。");
          if (notification is ScrollStartNotification) {
            print("开始滚动");
          } else if (notification is ScrollUpdateNotification) {
            print(
                "正在滚动。。。最大滚动范围${notification.metrics.maxScrollExtent},当前滚动的位置${notification.metrics.pixels}");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动");
          }

          return true;
        },
        child: ListView.builder(
            controller: _controller,
            itemBuilder: (BuildContext ctx, int index) {
              return ListTile(
                leading: Icon(Icons.mail),
                title: Text("邮箱 $index"),
              );
            }),
      ),
      floatingActionButton: _isShowFloatingBtn
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(seconds: 1), curve: Curves.easeIn);
              },
            )
          : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
