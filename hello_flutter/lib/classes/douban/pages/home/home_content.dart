import 'package:flutter/material.dart';
import 'package:hello_flutter/service/home_request.dart';

class JLHomeContent extends StatefulWidget {
  const JLHomeContent({super.key});

  @override
  State<JLHomeContent> createState() => _JLHomeContentState();
}

class _JLHomeContentState extends State<JLHomeContent> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 发送网络请求
    HomeRequest.requestMoveList(0).then((res){
      print(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (ctx, int index) {
          return ListTile(title:  Text("item$index"),);
        }
    );
  }
}
