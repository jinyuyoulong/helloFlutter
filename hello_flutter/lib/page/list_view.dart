import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter/classes/day03/01_%E6%96%87%E6%9C%AC%E7%BB%84%E4%BB%B6.dart';
import 'package:hello_flutter/classes/day03/02_%E6%8C%89%E9%92%AEWidget.dart';
import 'package:hello_flutter/classes/day03/03_%E5%9B%BE%E7%89%8701.dart';
import 'package:hello_flutter/getx/counter_get/view.dart';

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
            return TextViewPage();
          }),
          );
        }, child: Text("data")),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ButtonsPage();
          }));
        }, child: Text("Buttons")),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ImageViewPage();
          }));
        }, child: Text("图片")),
        TextButton(onPressed: (){
          print("goto dio");
          Navigator.push(context, MaterialPageRoute(builder: (context){
          return CounterGetPage();
          }),
          );
        }, child: Text("dio")),
      ],
    );



  }
}
