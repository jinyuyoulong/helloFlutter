import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  final usernameTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(// 给 TextField 设置边框颜色：包一层 Theme -> 设置data：ThemeData
      data: ThemeData(
        primaryColor: Colors.red,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: usernameTextEditingController,
              decoration: InputDecoration(
                labelText: "username",
                icon: Icon(Icons.people),
                hintText: "请输入用户名",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.red[100],// 100为混合的颜色值
              ),
              onChanged: (value){
                print("onChanged:$value");
              },
              onSubmitted: (value){
                print("onSubmitted:$value");
              },
            ),
            SizedBox(height: 10,),
            TextField(
              controller: passwordTextEditingController,
              decoration: InputDecoration(
                labelText: "密码",
                icon: Icon(Icons.lock),
                border: InputBorder.none,
              ),
//            onChanged: ,
            ),
            SizedBox(height: 10,),
            Container(
              // 给button设置宽高，不能直接给btn设置，需要包裹一层Container，然后用btn填充
              // double.infinity 代表最大，能填充多大填多大
              width: double.infinity,
              height: 40,
              child: TextButton(
                onPressed: (){
                  final username = usernameTextEditingController.text;
                  final password = passwordTextEditingController.text;
                  print("用户名$username 密码$password");
                  // 可以添加监听
                  usernameTextEditingController.addListener(() {

                  });
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                child: Text("登 录",style: TextStyle(fontSize: 20,color: Colors.white),),

              ),
            ),
          ],
        ),
      ),
    );

  }
}

