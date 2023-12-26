import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/page/list_view.dart';
import 'package:hello_flutter/service/http_echo_model.dart';
import 'package:hello_flutter/service/http_request.dart';

class JLHomePage extends StatelessWidget {
  const JLHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("demo list"),
      ),
      body: const JLContentBody(),
    );
  }
}

class JLContentBody extends StatefulWidget {
  const JLContentBody({super.key});

  @override
  _JLContentBodyState createState() => _JLContentBodyState();
}

class _JLContentBodyState extends State<JLContentBody> {

  @override
  Widget build(BuildContext context) {
    return const MainListView();
  }
}
