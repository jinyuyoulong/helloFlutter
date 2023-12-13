import 'dart:math';
import 'package:flutter/material.dart';
main() => runApp(const MyApp());

/*
* Widget:
* 有状态Widget：StatefulWidget 在运行过程中有一些状态(data)需要改变
* 无状态Widget: StatelessWidget 内容是确定没有状态(data)的改变的
* */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JLHomePage(),
    );
  }
}

class JLHomePage extends StatelessWidget{
  const JLHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("scrollView"),
      ),
        body: const CustomScrollMixView()
    );
  }
}

class CustomScrollMixView extends StatelessWidget {
  const CustomScrollMixView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView( // 多个sliver
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,// 显示sliver bar头
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("标题"),
            background: Image.asset("assets/images/a_dot_ham.png", fit: BoxFit.cover,), // 背景图片撑满
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                return  Container(
                  color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
                );
              },
              childCount: 10
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.5,
          ),),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                return ListTile(
                  leading: const Icon(Icons.people),
                  title: Text("联系人$index"),
                );
              },
              childCount: 20
          ),
        )
      ],
    );
  }
}

// slider的基本使用
class CoustomScrollView1 extends StatelessWidget{
  const CoustomScrollView1({super.key});


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
//        只能放 sliverList，sliverGrid, sliverpadding
        SliverSafeArea(
          sliver: SliverPadding(// 添加外边距，并且可以滚动到顶部
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.5,
              ),
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index){
                    return  Container(
                      color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
                    );
                  },
                  childCount: 100
              ),
            ),
          ),
        )
      ],
    );
  }
}