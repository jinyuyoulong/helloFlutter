import 'package:flutter/material.dart';
import 'package:helloFlutter/douban/widgets/star_rating.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "豆瓣",
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: JLHomePage(),
    );
  }
}

class JLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表测试"),
      ),
      body: Container(
        width: 200,
        child: DashedLine()
      ),
    );
  }
}

class DashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedHeight;
  final double dashedWidth;
  final int count;
  final Color color;
  DashedLine({
  this.axis = Axis.vertical,
    this.dashedHeight,
    this.dashedWidth,
    this.count,
    this.color
});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
