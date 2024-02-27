import 'dart:math';

import 'package:flutter/material.dart';

/*
* Widget:
* 有状态Widget：StatefulWidget 在运行过程中有一些状态(data)需要改变
* 无状态Widget: StatelessWidget 内容是确定没有状态(data)的改变的
* */

class ListGrideWidgetDemo extends StatelessWidget{
  const ListGrideWidgetDemo({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("列表视图"),),
      body: const Column(
        children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListViewDemo1(),
                ListViewSeparated(),
                ListViewBuilder(),
              ],
            ),

          Text("demo1"),
          GridViewDemo1(),
          Text("demo2"),
          GridViewDemo2(),
          Text("grid builder"),
          GridViewBuider(),
        ],
      ),
    );

  }
}

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,// 交叉轴上的个数
              childAspectRatio: 1.0,// 高度对宽度的比例，以宽度的比例确定
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            children: List.generate(50, (index) {
              return Container(
                color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
              );
            })
        ),
      ),
    );
  }
}
class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(// 设置最大宽度，自动计算个数
          maxCrossAxisExtent: 50,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,

        ),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
          );
        }),
      ),
    );
  }
}
class GridViewBuider extends StatelessWidget {
  const GridViewBuider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(// cell需要时加载
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (BuildContext ctx, int index){
            return Container(
              color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
            );
          }
      ),
    );
  }
}

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 100,
      child: ListView.separated(// cell 是自适应高度。
        itemBuilder: (BuildContext context, int index){
          return Text("$index");
        },
        separatorBuilder: (BuildContext context, int index){
          return const Divider(
            color: Colors.red,
            height: 10,// 线占据的高度（很像cell的高度
            indent: 30,// start 边距
            endIndent: 15,// end边距
            thickness: 2,// 线宽
          );
        },
        itemCount: 100,
        cacheExtent: 60,// 默认预加载的高度
      ),
    );
  }
}
class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ListView.builder(// 展示的时候在加载
        itemExtent: 30,// cell 高度
        itemCount: 100,// item数量
        itemBuilder: (BuildContext context, int index){// 返回的cell
          return Text("$index");
        },
      ),
    );
  }
}
class ListViewDemo1 extends StatelessWidget {
  const ListViewDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: ListView(

        scrollDirection: Axis.vertical,// 设置垂直/水平滚动，
        itemExtent: 100,// 设置水平滚动，需要设置该值
        children: List.generate(100, (index) {
          return ListTile(
            leading: const Icon(Icons.people),
            trailing: const Icon(Icons.delete),
            title: Text("联系人${index+1}"),
            subtitle: const Text("电话号码：18800000000"),
          );
        }),
      ),
    );
  }
}