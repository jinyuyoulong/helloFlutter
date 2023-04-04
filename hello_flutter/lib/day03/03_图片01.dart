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
    return Image(
//    1. 在Flutter项目中创建一个文件夹，存储文件
//    2. 在 pubspec.yaml 进行配置
//    3. 使用图片
        image:  AssetImage("assets/images/a_dot_ham.png")
    );
  }


}
class ImageDemo01 extends StatelessWidget {
  const ImageDemo01({
    required Key key,
    @required this.imgURL,
  }):super(key:key);
  final imgURL;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imgURL),
      color: Colors.red,// 这里的颜色是混入到图片中
      colorBlendMode: BlendMode.colorDodge,// 设置color混入模式
      width: 200,
      height: 200,
      fit: BoxFit.contain,// 填充方式
      repeat: ImageRepeat.repeatY,
//          fitWidth: 宽度一定，高度自适应，
//        fitHeight: 高度一定，宽度自适应
//        alignment: Alignment.bottomCenter,
      alignment: Alignment(0, -1),//取值范围 -1,1 中间位置是0，0  自定义
    );
  }
}


