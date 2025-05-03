import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({super.key});
  final imgURL =
      "https://www.baidu.com/img/PCfb_5bf082d29588c07f842ccde3f97243ea.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("图片"),
        ),
        body: ListView(
          children: [
            const Image(
                /*
          1. 在Flutter项目中创建一个文件夹，存储文件
          2. 在 pubspec.yaml 进行配置
          3. 使用图片
          */
                image: AssetImage("assets/images/a_dot_ham.png")),
            Text("网络图片"),
            // chrome mac desktop 两个平台不能正常显示应该是跨域或支持问题
            Image.network(imgURL),
            Text("网络图片设置"),
            ImageDemo01(imgURL: imgURL)
          ],
        ));
  }
}

class ImageDemo01 extends StatelessWidget {
  // 不可变声明 final const
  final String imgURL;
  const ImageDemo01({
    super.key,
    required this.imgURL,
  });
  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imgURL),
      color: Colors.red, // 这里的颜色是混入到图片中
      colorBlendMode: BlendMode.colorDodge, // 设置color混入模式
      width: 200,
      height: 200,
      fit: BoxFit.contain, // 填充方式
      repeat: ImageRepeat.repeatY,
//          fitWidth: 宽度一定，高度自适应，
//        fitHeight: 高度一定，宽度自适应
//        alignment: Alignment.bottomCenter,
      alignment: const Alignment(0, -1), //取值范围 -1,1 中间位置是0，0  自定义
    );
  }
}
