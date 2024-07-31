import 'package:flutter/material.dart';

class JLHomeContent extends StatefulWidget {
  const JLHomeContent({super.key});

  @override
  State<JLHomeContent> createState() => _JLHomeContentState();
}

class _JLHomeContentState extends State<JLHomeContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("首页内容", style: TextStyle(fontSize: 32, color: Colors.green),),
    );
  }
}
