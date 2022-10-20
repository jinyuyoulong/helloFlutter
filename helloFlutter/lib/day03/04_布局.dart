import 'package:flutter/material.dart';
main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app title",
      home: JLHomePage(),
    );
  }
}
class JLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础Widget"),
      ),
      body: JLHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>print("浮动按钮"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
class JLHomeContent extends StatefulWidget {
  @override
  _JLHomeContentState createState() => _JLHomeContentState();
}

class _JLHomeContentState extends State<JLHomeContent> {
  final imgURL =  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=116882428,1733900798&fm=26&gp=0.jpg";
  @override
  Widget build(BuildContext context) {
    return Text("dd");

  }

}

class ImageExtensionDemo extends StatelessWidget {
  //    1. 占位图的问题
//  2. 图片缓存：flutter默认给图片做缓存，最多1000张，最大100M。
  const ImageExtensionDemo({
    required Key key,
    required this.imgURL,
  }) : super(key: key);

  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
//      设置过渡动画时间
        fadeOutDuration: Duration(milliseconds: 1),
        fadeInDuration: Duration(milliseconds: 1),
        placeholder: AssetImage("assets/images/a_dot_ham.png"),
        image: NetworkImage(imgURL));
  }
}

class ButtonExtensionDemo extends StatelessWidget {
  const ButtonExtensionDemo({
    required Key key,
  }) : super(key: key);

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
          child: ElevatedButton(
//            清除内边距
//               padding: EdgeInsets.all(0),
//              清除外边距
//               materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//               color: Colors.red,
              onPressed: (){},
              child: Text("FaltBtn1")
          ),
        ),
        ElevatedButton(
//          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: (){},
          style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
          child: Text("FaltB  tn2"),
        ),
      ],
    );
  }
}

class IconExtensionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Icon 是字体图标
    //1. 字体图标是矢量图，放大不会失真
    //2. 可以设置颜色
    //3. 图标很多是，占据控件更小
//    return Icon(Icons.pets, size: 300,color: Colors.orange,);
//    return Icon(IconData(0xe91d,fontFamily: 'MaterialIcons') , size: 300,color: Colors.orange,);
//  1. Text 中不能直接使用编码，需要转换 0xe91d-> unicode编码
    return Text("\ue91d",style: TextStyle(fontSize: 100,color: Colors.orange,fontFamily: 'MaterialIcons'),);
  }
}


