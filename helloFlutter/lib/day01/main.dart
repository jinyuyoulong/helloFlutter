import 'package:flutter/material.dart';
main(){
//  1. runAPP
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("第一个flutter程序"),
          ),
          body: const Center(
            child: Text(
              "hello world",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange
              ),
            ),
          ),
        ),
      )
  );
}
