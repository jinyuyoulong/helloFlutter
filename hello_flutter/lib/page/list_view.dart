import 'package:flutter/material.dart';
import 'package:hello_flutter/classes/day03/01_%E6%96%87%E6%9C%AC%E7%BB%84%E4%BB%B6.dart';
import 'package:hello_flutter/classes/day03/02_%E6%8C%89%E9%92%AEWidget.dart';
import 'package:hello_flutter/classes/day03/03_%E5%9B%BE%E7%89%8701.dart';
import 'package:hello_flutter/classes/day03/04_%E5%B8%83%E5%B1%80.dart';
import 'package:hello_flutter/classes/day03/05_TextField.dart';
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
        TextButton(onPressed: (){
          print("goto dio");
          Navigator.push(context, MaterialPageRoute(builder: (context){
          return CounterGetPage();
          }),
          );
        }, child: const Text("dio")),
      ],
    );



  }
}
