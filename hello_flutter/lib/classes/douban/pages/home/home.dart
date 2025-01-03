import 'package:flutter/material.dart';
import 'home_content.dart';

class JLHomePage extends StatefulWidget {
  const JLHomePage({super.key});

  @override
  State<JLHomePage> createState() => _JLHomePageState();
}

class _JLHomePageState extends State<JLHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页"), titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        backgroundColor: Colors.green, centerTitle: true,),
      body: JLHomeContent(),
    );
  }
}
