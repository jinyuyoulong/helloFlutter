import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JLHomePage(),
    );
  }
}

class JLHomePage extends StatelessWidget {
  const JLHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( "商品列表"),
      ),
      body: const JLHomeContent(),
    );
  }
}
class JLHomeContent extends StatelessWidget {
  const JLHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
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
  final style1 = const TextStyle(fontSize: 25,color: Colors.orange);
  final style2 = const TextStyle(fontSize: 22,color: Colors.green);

  const JLHomeProductItem(this.title,this.desc,this.imageURL, {super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(12),
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
          const SizedBox(height: 8,),
          Text(desc,style: style2,),
          Image.network(imageURL)
        ],
      ),
    );
  }
}
