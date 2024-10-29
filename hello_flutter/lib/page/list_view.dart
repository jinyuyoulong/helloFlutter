import 'package:flutter/material.dart';
import 'package:hello_flutter/classes/day03/01_%E6%96%87%E6%9C%AC%E7%BB%84%E4%BB%B6.dart';
import 'package:hello_flutter/classes/day03/02_%E6%8C%89%E9%92%AEWidget.dart';
import 'package:hello_flutter/classes/day03/03_%E5%9B%BE%E7%89%8701.dart';
import 'package:hello_flutter/classes/day03/04_%E5%B8%83%E5%B1%80.dart';
import 'package:hello_flutter/classes/day03/05_TextField.dart';
import 'package:hello_flutter/classes/day03/07_%E5%B8%83%E5%B1%80%E5%A4%9A%E5%AD%90%E7%BB%84%E4%BB%B6.dart';
import 'package:hello_flutter/classes/day03/08_listView_GridView.dart';
import 'package:hello_flutter/classes/day03/09_customScrollView.dart';
import 'package:hello_flutter/classes/day05/03_scrollView%E6%BB%9A%E5%8A%A8%E7%9B%91%E5%90%AC.dart';
import 'package:hello_flutter/classes/day05/04_%E7%BD%91%E7%BB%9C%E8%AF%B7%E6%B1%82dio.dart';
import 'package:hello_flutter/classes/douban/main.dart';
import 'package:hello_flutter/getx/counter_get/view.dart';

import '../classes/day03/06_布局单子组件.dart';

class MainListView extends StatelessWidget {
  const MainListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      itemExtent: 50.0,
      children: <Widget>[
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const DouBanHomePage();
          }));
        }, child: const Text("豆瓣")),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const TextViewPage();
          }));
        }, child: const Text("data")),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const ButtonsPage();
          }));
        }, child: const Text("Buttons")),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const ImageViewPage();
          }));
        }, child: const Text("图片")),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
              return const LayoutDemoPage();
          }));
        }, child: const Text("布局")),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const TextFieldPage();
          }));
        }, child: const Text("Textfield")),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const SingleLayoutWidget();
          }));
        }, child: const Text("布局单子组件")),
        OutlinedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const MutiLayoutWidget();
          }));
        }, child: const Text("布局多子组件")),
        OutlinedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const ListGrideWidgetDemo();
          }));
        }, child: const Text("列表")),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const CustomScrollWidget();
          }));
        }, child: const Text("scroll view")),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const ScrollListenor();
          }));
        }, child: const Text("scroll 滚动监听")),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const DioNetworkDemo();
          }));
        }, child: const Text("Dio网络请求")),
        TextButton(onPressed: (){
          print("goto GetX");
          Navigator.push(context, MaterialPageRoute(builder: (context){
          return CounterGetPage();
          }),
          );
        }, child: const Text("dio")),

      ],
    );



  }
}
