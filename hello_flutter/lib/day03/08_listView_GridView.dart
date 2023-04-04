import 'dart:math';

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

class JLHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个flutter程序"),
      ),
      body:JLContentBody(),
    );
  }
}

class JLContentBody extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GridView.builder(// cell需要时加载
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext ctx, int index){
          return Container(
            color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
          );
        }
    );

  }
}

class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(// 设置最大宽度，自动计算个数
        maxCrossAxisExtent: 100,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,

      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
        );
      }),
    );
  }
}

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,// 交叉轴上的个数
            childAspectRatio: .8,// 高度，以宽度的比例确定
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          children: List.generate(100, (index) {
            return Container(
              color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
            );
          })
      ),
    );
  }
}

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(// cell 是自适应高度。
      itemBuilder: (BuildContext context, int index){
        return Text("$index");
      },
      separatorBuilder: (BuildContext context, int index){
        return Divider(
          color: Colors.red,
          height: 10,// 线占据的高度（很像cell的高度
          indent: 30,// start 边距
          endIndent: 15,// end边距
          thickness: 2,// 线宽
        );
      },
      itemCount: 100,
      cacheExtent: 60,// 默认预加载的高度
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(// 展示的时候在加载
      itemExtent: 160,// cell 高度
      itemCount: 100,// item数量
      itemBuilder: (BuildContext context, int index){// 返回的cell
        return Text("$index");
      },
    );
  }
}

class ListViewDemo1 extends StatelessWidget {
  const ListViewDemo1({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,// 设置水平滚动，
      itemExtent: 100,// 设置水平滚动，需要设置该值
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text("联系人${index+1}"),
          subtitle: Text("电话号码：18800000000"),
        );
      }),
    );
  }
}