import 'package:flutter/material.dart';

class DouBanHomePage extends StatelessWidget {
  const DouBanHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "豆瓣",
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("列表测试"),
        ),
        body: const SizedBox(
            width: 200,
            child: DashedLine()
        ),
      ),
    );
  }
}

class DashedLine extends StatelessWidget {
  final Axis axis;
  final double? dashedHeight;
  final double? dashedWidth;
  final int? count;
  final Color? color;
  const DashedLine({super.key, 
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
