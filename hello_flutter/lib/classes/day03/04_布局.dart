import 'package:flutter/material.dart';
class LayoutDemoPage extends StatelessWidget {
  final imgURL =  "https://www.baidu.com/img/PCfb_5bf082d29588c07f842ccde3f97243ea.png";
  const LayoutDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("demo"),),
      body: Column(
        children: [
          const ButtonExtensionDemo(),
          ImageExtensionDemo(imgURL: imgURL),
          const IconExtensionDemo()
        ],

      ),
    );
  }
}
class ImageExtensionDemo extends StatelessWidget {
  //    1. 占位图的问题
//  2. 图片缓存：flutter默认给图片做缓存，最多1000张，最大100M。
  const ImageExtensionDemo({
    super.key,
    required this.imgURL,
  });

  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
//      设置过渡动画时间
        fadeOutDuration: const Duration(milliseconds: 1),
        fadeInDuration: const Duration(milliseconds: 1),
        placeholder: const AssetImage("assets/images/a_dot_ham.png"),
        image: NetworkImage(imgURL) 
    );
  }
}

class ButtonExtensionDemo extends StatelessWidget {
  const ButtonExtensionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
//       1. button 上下有一定的间距 padding
//        2. 默认button有默认的宽高 88*36
//        3. 去除button的内边距
        ButtonTheme(// 处理默认的最小宽高
          minWidth: 30,
          height: 10,
          child: TextButton(
            style: ButtonStyle(
              //            清除内边距
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                //              清除外边距
                tapTargetSize:  MaterialTapTargetSize.shrinkWrap,
                backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: (){},
              child: const Text("FaltBtn1")
          ),
        ),
        TextButton(

//          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: (){},
          style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.red)),
          child: const Text("FaltB  tn2"),
        ),
      ],
    );
  }
}

class IconExtensionDemo extends StatelessWidget {
  const IconExtensionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    //Icon 是字体图标
    //1. 字体图标是矢量图，放大不会失真
    //2. 可以设置颜色
    //3. 图标很多是，占据控件更小
//    return Icon(Icons.pets, size: 300,color: Colors.orange,);
//    return Icon(IconData(0xe91d,fontFamily: 'MaterialIcons') , size: 300,color: Colors.orange,);
//  1. Text 中不能直接使用编码，需要转换 0xe91d-> unicode编码
    return const Text("\ue91d",style: TextStyle(fontSize: 100,color: Colors.orange,fontFamily: 'MaterialIcons'),);
  }
}


