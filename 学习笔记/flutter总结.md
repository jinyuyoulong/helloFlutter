[TOC]

flutter 使用总结

## 安装

参考之前的环境安装一文

## 测试安装环境

`flutter doctor`

### 环境问题，工具问题，版本问题

- flutter环境变量，使用stable分支
- 工具，创建项目，测试一下是否OK
- SDK，android studio 搜索sdk，edit可以初始化SDK
- xcode，创建demo，运行一下检测
- VPN与镜像，各平台镜像，网上搜索
- 扩展工具dev tools 在浏览器查看flutterUI布局结构`pub global activate devtools` `export PATH="$PATH":"$HOME/.pub-cache/bin"`
- 镜像源替换  packages/flutter_tools/gradle/flutter.gradle

```groovy
// private static final String DEFAULT_MAVEN_HOST = "https://storage.googleapis.com";
  private static final String DEFAULT_MAVEN_HOST = "https://storage.flutter-io.cn/download.flutter.io";
```

## IDE
### androidStudio

安装插件：Dart+Flutter

hot reload 主要是执行main 中的 build方法，非build内的方法不被执行，比如：计数。

hot restart 会执行所有的方法

### vsCode

安装插件：Dart+Flutter

配置测试机：cmd+p 输入>flutter 选择Flutter Select Device或点击右下角，选择目标设备。
等待右下角的配置生效，点击右上角，小的start三角按钮，编译运行程序

### MaterialUI 

```dart
import 'package:flutter/cupertino.dart';
ios设计风格
```

runAPP => MaterialApp => scaffold 脚手架 => 自动以小部件

Scaffold脚手架类似UIViewController 或 Activity


## 声明式UI

声明式UI对应的是命令式。在win32到web，Android，iOS。UI的变更都是用的命令式。手动构建全功能的UI实体（View），然后在UI更改时用方法进行变更。Flutter让开发者描述当前UI状态，不需要关心它是如何过渡到框架。需要UI布局思维方式的转变。

```
命令式UI更改 Imperative style

b.setColor(red)
b.clearChildren()
View c3 = new View()
b.add(c3)
```

```
声明式UI写法 Declarative style
return ViewB(
	color: red,
	child: View(...),
)
```

由于视图配置widget是不可变的，更改UI的话，会引发自身重绘。flutter构建新的实例，而不是改变旧实例b。所以可以实现声明式UI。
flutter框架使用 renderObject管理传统UI对象的许多职能（如维护布局的状态）RenderObjects在帧之间保持不变，widgets告诉框架在状态之间改变RenderObjects，接下来Flutter框架会处理其余部分。

Android/ios中是命令式开发，不说状态，属性=数据

react-Vue-angular 是声明式编程，管好状态，让框架负责渲染

**注意：在flutter中所有的Widget都不能定义状态。**

StatefulWidget创建一个类，负责维护状态。setState。



## Flutter项目

### 如何创建flutter项目？

`flutter create name`

### 如何运行flutter项目

`flutter run -d 'iPhone X'`

配置iOS真机运行的环境

```
brew update
brew install --HEAD libimobiledevice
brew install ideviceinstaller ios-deploy cocoapods
pod setup
// -- 
配置证书，信任设备
flutter run 运行
```



### 如何导入widget

`import 'dart:convert';`

### 如何写一个helloworld

### 如何使用widget并将其嵌套，形成widget树

widget树就是组件化开发的思想。

widget 最最基本的控件结构。

widget可以定义：

- 结构元素：如按钮或菜单

- 文体元素：像字体或颜色主题

- 类似布局的填充或对其的方式

### 如何创建可重用widget

```dart
class MyHomePage extends StatefulWidget {
  MyHomePage({@required Key key, this.title}) : super(key: key);
}
注意：参数为大括号，默认可选，@required注解为必填。
```

## 项目结构，静态资源，本地化

- 项目文件结构是怎样的？
- 在哪里归档图片资源以及处理不同分辨率？
- 如果归档strings资源，以及国际化
- 如何添加flutter依赖

```
./ projectname
├── README.md
├── android 安卓工程文件
├── build 项目构建输出目录
├── helloFlutter.iml
├── ios iOS部分工程文件
├── lib
│   └── src 	包含其他源文件
│   └── main.dart	自动生成的项目入口文件，类似RN的index.js
├── pubspec.yaml 	- 项目依赖配置文件，类似RN的package.json
└── test			- 测试相关文件
```

Assets可以被放置到任何属性文件夹中--flutter并没有预先定义的文件结构。

assets 中可以放任意文件，需要在yaml中声明assets的位置，flutter会识别。

```
assets:
 - my-assets/data.json
```

然后用AssetBundle访问

```dart
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
Future<String> loadAsset() async {
	return await rootBundle.loadString('my-assets/data.json');
}
```

图片命名格式类似iOS，遵循 1.0x 2.0x 3.0x 倍数。

Android不同像素密度和flutter像素比例对应关系

```
ldpi 		0.75x
mdpi		1.0x
hdpi		1.5x
xhdpi		2.0x
xxhdpi	3.0x
xxxhdpi	4.0x
```

例：将my_icon.png 的图片放到flutter工程中

```
放置:
images/my_icon.png // 1.0x
images/2.0x/my_icon.png // 2.0x
images/3.0x/my_icon.png // 3.0x

yaml声明:
assets:
 - images/my_icon.png

使用:
return AssetImage("images/my_icon.png")
```

不像iOS 拥有 Localizable.strings 文件，flutter目前没有专门的字符串资源系统。最佳做法是将strings资源作为静态字段保存在类中。例：

```dart
class Strings{
	static String welcomeMessage = "Welcome To Flutter";
}
使用
import 'package:flutter_localizations/flutter_localizations.dart';
Text(Strings.welcomeMessage);
```

flutter 默认支持美式英语，需要引入 flutter_localizations 包。和intl 包支持其他 i10n 机制，比如日期/时间格式化。

```
dependencies:
 flutter_localizations:
 	sdk: flutter
 intl: "^0.16.1"
```

### Widget 

> 请记住一下规则：如果Widget在build之外更改（例如：用于运行时用户交互）则他是有状态的。如果Widget永远不会改变，一旦构建，他就是无状态的。但是，即使Widget是有状态的，如果包含他的父窗口小部件本身不对这些更改（或输入）做出反应，父Widget仍然可以是无状态的。

Widget更像是配置文件。

Widget 有@immutable注解，说明是不可变的

如何设置Widget的动画？

animosity

如何设置Widget的绘图？

如何设置Widget的透明度？

```
Opacity(
	opacity: 0.5,
	child: Text('透明度50%')
)
```

StatelessWidget

```dart
/*
* 为什么flutter在设计的时候StatefulWidget的build方法放在State中
* 1. build出来的Widget是需要依赖State中的变量（状态/数据)
* 2. 在Flutter的运行过程中：
*     Widget是不断地额销毁和创建的
*     当我们自己的状态发生改变时，并不希望重新创建一个新的State
* */
```

StatefulWidget 

```dart

class JLContentBody extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return JLContentBodyState();
  }

}
class JLContentBodyState extends State<JLContentBody>{

  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,//主轴
        children: <Widget>[
          Checkbox(
              value: flag,
              onChanged: (value){
                setState(() {
                  flag = value;
                });
                print(flag);
              }),
          Text("同意协议")
        ],

      ),
    );
  }
}
```

### 管理状态

#### 内部状态 参考RN的状态管理

在setState中更新状态

```dart
class _JLHomeContentState extends State<JLHomeContent> {
  int _counter = 0;// 内部状态

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,//主轴居中
        children: <Widget>[
          _getButtons(),
          Text("当前计数:$_counter",style: TextStyle(fontSize: 25),),
          Text("传过来的信息:${widget.message}",)
        ],
      ),
    );
  }

  Widget _getButtons(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            child: Text("+", style: TextStyle(fontSize: 20, color: Colors.white),),
            color: Colors.red,
            onPressed: (){
              setState(() {
//                相当于匿名函数，这里，外边设置++也可以
                _counter ++;
              });
            }),
      ],
    );
  }
}
```

#### 外部状态 参考RN的状态管理

state类中有绑定widget变量和Widget类对应。

```dart
class JLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "商品列表"),
      ),
      body: JLHomeContent("haha"),
    );
  }
}

//Widget 不加下划线，一般暴露给外部使用。
//State 是加下划线，状态类，只给Widget内部使用
class JLHomeContent extends StatefulWidget {
  final String message;
  JLHomeContent(this.message);

  @override
  _JLHomeContentState createState() => _JLHomeContentState();
}

class _JLHomeContentState extends State<JLHomeContent> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,//主轴居中
        children: <Widget>[
          _getButtons(),
          Text("当前计数:$_counter",style: TextStyle(fontSize: 25),),
          Text("传过来的信息:${widget.message}",)// 使用外部的状态
        ],
      ),
    );
  }
}
```

## 布局

flutter使用row和Colum进行水平和垂直布局

flex 布局

对于Colum 纵轴是主轴

对于Row 横轴是主轴

他们都有交叉轴

```
return row(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
Text(Row one),
Text(Row two),
],
);
```

```dart
@override
Widget build(BuildContext context){
	return Colum(
		mainAxisAlignment:MainAxisAlignment.center,
		children: <Widget>[
			Text(Column one),
			Text(Column two),
		],
	);
}
```

RelativeLayout 在flutter中等价于什么？

RelativeLayout用于使Widget相对于彼此位置排列。在Flutter中，有几种方法可以实现相同的效果：Column、row和Stack组合实现RelativeLayout的效果

## 生命周期

flutter 中只需要监听widget的生命周期就行。iOS中需要监听Controller和View的声明周期

### statelessWidget 的生命周期

```
构造函数
build
class JLHomeContent extends StatelessWidget {
  final String message;
  JLHomeContent(this.message){
    print("构造函数被调用");
  }

  @override
  Widget build(BuildContext context) {
    print("调用build方法");
    return Text(message);
  }
}
```

### statefulWidget的生命周期

分为两部分

```dart
1. Stateful Widget
Constructor -> Widget_createState()
2. State_object
Constructor -> mounted -> initState -> dirty state ->build -> clean state -> dispose
															↓						↑			↑									↓
																					   		↑	setState			 ←↓
											didChangeDependencies			↑didUpdateWidget ←↓
```

![statefulWidget生命周期](./src/img/statefulWidget生命周期.png)

didUpdateWidget 

```dart
class JLHomeContent extends StatefulWidget {
  JLHomeContent(){
    print("1.调用JLHomeContent的constructor");
  }
  @override
  _JLHomeContentState createState() {
    print("2.调用JLHomeContent的createState方法");
    return _JLHomeContentState();
  }
}

class _JLHomeContentState extends State<JLHomeContent> {
  _JLHomeContentState(){
    print("3.调用_JLHomeContentState的constructor方法");
  }
  @override
  void initState() {
    print("4. 调用State的initState方法");
    // 这里必须调super
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    print("5. 调用build ");
    return Text("data");
  }

  @override
  void dispose() {
    print("6.调用State的dispose方法");
    super.dispose();
  }
}
```

## 控件

styles Widget 样式小部件。

ListView = ScrollView+ListView

参数是一个widgets的数组

如何更新ListView？

简单方法是：在setState中创建一个新的list，并把旧list的数据拷贝给新的list。但是不推荐。

推荐做法：ListView.builder(itemBuilder:())

```dart
body: ListView.builder(
	itemCount: widgets.length,
	itemBuilder: (BuilderContext context,int position){
		return getRow(position)
	}
)

Widget getRow(int i){
	return GestureDetector(
		child: Padding(
			padding: EdgeInsets.all(10.0),
			child: Text("Row $i"),
		),
		onTap: (){
			setState((){
        // 当点击时 动态添加一个元素，而不是创建一个list。高明的地方
       // 不会导致整个列表被渲染，只会渲染部分，所以效率比较高。 
				widgets.add(getRow(widgets.length+1));
				print('row $i');
			});
		},
	);
}
```

## 编程范式

编程范式对于初学者来说感受不深刻，但是在日常中随处可见。比如面向对象编程 就是一种编程范式，与之对应的事面向过程编程，函数式编程，面向协议编程。

还有两种编程范式：命令式编程 和 声明式编程

- 命令式编程：就是一步步给计算机命令，告诉他我们想做什么事情。
- 声明式编程：是描述目标的性质，你应该是什么样的，依赖哪些状态，并且当以来的状态发生改变时，我们通过某些方式通知目标作出相应的

## 使用注意

### 热更新

原理是在本地搞了一个服务器，localhost所以真机测试是不行的。只能使用模拟器，才能热更新。

命令行 flutter run  然后执行 r 更新UI

AS run 保存就可以，右上角有热更新按钮，⚡️

### 包管理

flutter packages get 更新一定要在终端执行更新，as中无法中断进程导致进程锁死 。我的问题是包名写错了，一直更新失败。as无法中断该进程。在中断更新就很容易退出进程了。

如果进程锁死解决：

删除文件 flutter/bin/cache/lockfile,可以解放进程



### 快捷键

stl 创建StatelessWidget类

alt+enter 包一层部件

cmd+alt+B 查看抽象类的子类。

alt+enter 将statelessWidget 转换为StatefulWidget

alt+cmd+M 抽取组件代码生产组件方法

alt+cmd+W 抽取组件代码生成组件类 快捷键冲突，可以右键重构选项。

cmd+alt+L 格式化代码

### 辅助工具

Dev Tools查看UI结构

pub全局安装插件，配置环境变量，在AS中点击右下方的OpenDevTools。会启动一个server，打开浏览器，显示UI结构

