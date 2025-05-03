import 'package:flutter/material.dart';

class JLSubjectPage extends StatelessWidget {
  const JLSubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back)),
        title: const Text("书影音"),),
      body: const Center(
        child: Text("书影音"),
      ),
    );
  }
}
