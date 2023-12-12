import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() => runApp(MyApp());

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
    );
  }
}

class JLHomeContent extends StatefulWidget {
  @override
  _JLHomeContentState createState() => _JLHomeContentState();
}

class _JLHomeContentState extends State<JLHomeContent> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    /*
    * Flex(direction: Axis.horizontal); = Row
    * Flex(direction: Axis.vertical); = Column
    * 实际开发中不常用Flex
    * */
/*
* Stack 层叠布局组件
* 根据 alignment: AlignmentDirectional.center, 为原点，按数组顺序叠放
* 默认大小是包裹内容
* fit: expand 将子元素拉伸到尽可能大
* - overflow: 超出部分如何处理 overflow: Overflow.visible,查出部分依然可见，默认不可见
*
* Positioned 定位
* */
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Image(image: AssetImage("assets/images/a_dot_ham.png")),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: Color.fromARGB(100, 100, 100, 100),
//                  width: double.infinity,
//                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "范金龙最棒",
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          icon: Icon(Icons.favorite,
                              color: isFavorite ? Colors.white : Colors.red),
                          onPressed: () {
                            this.setState(() {
                              isFavorite = !isFavorite;
                            });
                          })
                    ],
                  ))),
        ],
      ),
    );
  }
}

// Row 进阶知识
class RowDemo2 extends StatelessWidget {
  const RowDemo2({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // 主轴对齐方式
        mainAxisSize: MainAxisSize.max,
        // 设置主轴宽度
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          /*
          * 拉伸
          * Flexible 将屏幕剩余空间集中分配,设置拉伸
          * - flex:
          * Expended -> Flexible(fit: FlexFit.tight) 通常工程中，用这个更多，很少用Flexible
          * 空间分配问题：flex 设置了之后，宽度就失效了，之后和flex比例相关了，和css不一样，css有一套公式
          *
          *
          * 收缩 也是用Expanded
          *
          * */
          Expanded(
//              flex: 1,
              child: Container(
                width: 160,
                height: 80,
                color: Colors.red,
              )),
          Container(
            width: 60,
            height: 70,
            color: Colors.green,
          ),
          Expanded(child: Container(width: 60, height: 50, color: Colors.blue)),
          Container(width: 100, height: 80, color: Colors.yellow),
        ],
      ),
    );
  }
}

class ColumDemo extends StatelessWidget {
  const ColumDemo({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      verticalDirection: VerticalDirection.up,
      // 控制children 的罗列方向顺序
      textBaseline: TextBaseline.ideographic,
      children: <Widget>[
//          Icon(Icons.pets),
//          Text("data"),
        Container(
          width: 60,
          height: 80,
          color: Colors.red,
          child: Text(
            "Hello x",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
            width: 60,
            height: 70,
            color: Colors.green,
            child: Text(
              "world x",
              style: TextStyle(fontSize: 30),
            )),
        Container(
            width: 60,
            height: 50,
            color: Colors.blue,
            child: Text(
              "fan x",
              style: TextStyle(fontSize: 40),
            )),
      ],
    );
  }
}

/*
Row基本使用
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
class RowDemo extends StatelessWidget {
  const RowDemo({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // 主轴对齐方式
      mainAxisSize: MainAxisSize.max,
      // 设置主轴宽度
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      verticalDirection: VerticalDirection.down,
      // 用于Column,控制textDirection
      children: <Widget>[
//          Icon(Icons.pets),
//          Text("data"),
        Container(
          width: 60,
          height: 80,
          color: Colors.red,
          child: Text(
            "Hello x",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
            width: 60,
            height: 70,
            color: Colors.green,
            child: Text(
              "world x",
              style: TextStyle(fontSize: 30),
            )),
        Container(
            width: 60,
            height: 50,
            color: Colors.blue,
            child: Text(
              "fan x",
              style: TextStyle(fontSize: 40),
            )),
      ],
    );
  }
}
