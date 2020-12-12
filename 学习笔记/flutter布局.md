[TOC]

flutter 有三层树结构：Widget、Element、RenderObject

```dart
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
    Key key,
    @required this.imgURL,
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
    Key key,
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
          child: FlatButton(
//            清除内边距
              padding: EdgeInsets.all(0),
//              清除外边距
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Colors.red,
              onPressed: (){},
              child: Text("FaltBtn1")
          ),
        ),
        FlatButton(

//          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: (){},
          color: Colors.red,
          child: Text("FaltB  tn2"),
        ),
        SizedBox(height: 10,),// 设置间距
          Container(
// 给button设置宽高，不能直接给btn设置，需要包裹一层Container，然后用btn填充
// double.infinity 代表最大，能填充多大填多大
            width: double.infinity,
            height: 40,
            child: FlatButton(
                onPressed: (){},
              	color: Colors.blue,
                child: Text("登 录",
                     style: TextStyle(fontSize: 20,color: Colors.white),),

            )
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


	
```

## 单子布局

**Align -> Center，Container，Padding**

flutter 中的坐标系为: (0, 0)  是中心点。极值(-1, 1)

```
				-1
				|
				|
-1------0------->1
				|
				|
				↓
				1
```

Container layout

RenderWidget -> RenderObject ->

{constraints 约束

BoxConstraint

minWidth minHeight

maxWidth maxHeight}

子组件在父组件的范围内调整Size 大小，子组件超出会报错超出安全区域。

不同的子组件对于同样的约束，表现可能不同。

## 多子布局

Row Column Stack

Row和Column都是继承自Flex组件,类似CSS中的Flex布局

## Row的特点：水平方向尽可能大的占领空间，水平方向也是希望包裹内容，

垂直方向包裹内容。

```
 /*
    * Flex(direction: Axis.horizontal); = Row
    * Flex(direction: Axis.vertical); = Column
    * 实际开发中不常用Flex
    * */
/*
* MainAxisAlignment:
* - start 主轴开始位置挨个摆放元素
* - end 主轴结束位置挨个摆放元素
* - center 主轴中心位置挨个摆放元素(默认值）
* - spaceBetween  左右两边为0，其他平分间距
* - spaceAround 左右两边间距为其他间距的一半
* - spaceEvenly 所有间距平分
*
* CrossAxisAlignment:
* - start 交叉轴开始位置挨个摆放元素
* - end 交叉轴结束位置挨个摆放元素
* - center 交叉轴中心位置挨个摆放元素(默认值）
* - baseline  基线对齐 CSS，文字排版，四线三格，基线：X下边的线,有文本才有效果
* - stretch 先让交叉轴row占据较大的空间，将所有的子Widget交叉轴的高度，拉升到最大
* */
```

## Column：



收缩+拉伸

```dart
/*
          * 拉伸
          * Flexible 将屏幕剩余空间集中分配,设置拉伸
          * - flex:
          * Expended -> Flexible(fit: FlexFit.tight) 通常工程中，用这个更多，很少用Flexible
          * 空间分配问题：flex 设置了之后，宽度就失效了，之后和flex比例相关了，
          * 和css不一样，css有一套公式
          * 
          *
          * 收缩 也是用Expanded
          *
          * */
          Expanded(
//              flex: 1,
              child: Container(width: 160,height: 80, color: Colors.red,)
          ),
```

## Stack 层叠组件

```dart
/*
* Stack 层叠布局组件
* 根据 alignment: AlignmentDirectional.center, 为原点，按数组顺序叠放
* 默认大小是包裹内容
* fit: expand 将子元素拉伸到尽可能大
* - overflow: 超出部分如何处理 overflow: Overflow.visible,查出部分依然可见，默认不可见
*
* Positioned 定位
* */
Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container()
  )
```

