import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JLHomePage(),
    );
  }
}

class JLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "商品列表"),
      ),
      body: JLHomeContent(),
    );
  }
}
class JLHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        JLHomeProductItem("apple1","macbook1","https://wx4.sinaimg.cn/large/0085KTY1gy1ghkog7oc2bj31400u0wji.jpg"),
        SizedBox(height: 5,),
        JLHomeProductItem("apple2","macbook2","https://wx2.sinaimg.cn/large/72615df6ly1ghknb1e0ygj20gn0du4dp.jpg"),
        SizedBox(height: 5,),
        JLHomeProductItem("apple3","macbook3","https://wx4.sinaimg.cn/large/0085KTY1gy1ghkn9o93blj30dn0gm43f.jpg"),
      ],
    );
  }
}

class JLHomeProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;
  final style1 = TextStyle(fontSize: 25,color: Colors.orange);
  final style2 = TextStyle(fontSize: 22,color: Colors.green);

  JLHomeProductItem(this.title,this.desc,this.imageURL);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border:  Border.all(
            width: 5,// 设置边框的
            color: Colors.pink
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(title,style: style1,textAlign: TextAlign.right,),
          SizedBox(height: 8,),
          Text(desc,style: style2,),
          Image.network(imageURL)
        ],
      ),
    );
  }
}
