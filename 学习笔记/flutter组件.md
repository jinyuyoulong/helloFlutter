[TOC]

```
- 基础组件
  - Widget 与 Element
  - StatelessWidget
  - StatefulWidget
  - Text
  - Image
  - Button
  - AppBar
  - AlertDialog
  - Icon
  - TextField
  - Form
  - Switch
  - Checkbox

- 布局组件
  - 线性 Row 行 X轴
  - 线性 Column 列 Y轴
  - 弹性 Flex 盒 伸缩到父视图
  - 弹性 Expanded
  - 层叠 Stack 栈 Z轴
  - 层叠 IndexedStack
  - 层叠 Positioned
  - 流式 Flow
  - 流式 Wrap

- 容器组件
  - Scaffold
  - Container
  - Center
  - Padding
  - ConstrainedBox
  - SizedBox
  - DecoratedBox
  - Transform

- 导航组件
  - TabBar
  - NavigationBar
  - PageView

- 可滚动组件
  - CustomScrollView
  - ListView
  - GridView
  - ScrollView
  - ExpansionPanel
  - ScrollController

- 表格组件
  - Table
  - DataTables

- 功能型组件
  - WillPopScope
  - InheritedWidget
  - 主题 Theme

- 事件处理与通知
  - 事件处理
  - 手势识别
  - 全局事件总线
  - 通知消息

- 自定义 Widget
  - 组合其它 Widget
  - 自绘 CustomPaint、Canvas

- 进阶
  - 文件操作
  - Http 请求
  - WebSocket 连接
  - Json 解析
  - 包与插件
  - 国际化
  - 数据库缓存
  - GetX
```

## 文本组件

Android中用TextView iOS中用UIlable flutter中Text组件

### 普通文本展示

flutter中，文本控制分为两类：

- **控制文本布局的参数**：如对齐方式 textAlign、排版方向 textDirection、显示最大行数 maxLines、阶段规则 overflow等等，这些都是构造函数中的参数；
- **控制文本样式的额参数**：如字体名称 fontFamily、字体大小 fontSize、文本颜色 color、阴影 shadows等等、这些参数统一封装到了构造函数中的参数style中；

### 富文本

```dart
Text.rich(TextSpan(
//      text: "富文本",
      children: [
        TextSpan(text: "文字", style: TextStyle(color: Colors.red)),
        WidgetSpan(child: Icon(Icons.favorite,color: Colors.red,)),
        // 图片
      ]
    ));
```

## 按钮Button

必传参数和required 必传参数不传就会报错，编译不过。@required编译可以通过，但会报警告。

1. RaisedButton
2. FlatButton
3. OutlineButton 边框按钮
4. floatingActionButton 浮动按钮
5. 自定义button：图标-文字-背景-圆角

```dart
Column(
      children: <Widget>[
        // 1. RaisedButton
        RaisedButton(
          child: Text("RaisedButton 高地按钮"),
          color: Colors.grey,
          textColor: Colors.white,
          onPressed: ()=> print("dd"),
        ),
        // FlatButton
        FlatButton(
            color: Colors.orange,
            child: Text("平坦的Flat 按钮"),
            onPressed: ()=>print("flat click"),
        ),
        // OutlineButton 边框按钮
        OutlineButton(
          child: Text("Outline button 边框按钮"),
          onPressed: ()=>print("边框按钮"),
        ),
        // 4. floatingActionButton 浮动按钮
        // 5. 自定义button：图标-文字-背景-圆角
        FlatButton(
          color: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.favorite,color: Colors.red,),
                Text("love范")
              ],
            ),
          onPressed: (){},
        )
      ],
    );
```

##  图片

```dart
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
    Key key,
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

```

