import 'package:flutter/material.dart';
import 'package:hello_flutter/classes/douban/widgets/star_rating.dart';

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
          title: const Text("豆瓣app"),
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: const DashedLine(dashedWidth: 8,count: 15,),
              ),
              Container(
                height: 200,
                child: const DashedLine(axis: Axis.vertical, dashedHeight: 8,count: 15,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// 虚线
class DashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;
  const DashedLine({
      this.axis = Axis.horizontal,
      this.dashedWidth = 1,
      this.dashedHeight = 1,
      this.count = 10,
      this.color = Colors.red
      });
  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: axis,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(count, (_){
          return SizedBox(
            width: dashedWidth,
            height: dashedHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color),
            ),
          );
        }),
    );
  }
}
