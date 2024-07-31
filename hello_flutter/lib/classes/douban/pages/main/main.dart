
import 'package:flutter/material.dart';
import 'initialize_items.dart';

class JLMainPage extends StatefulWidget {
  const JLMainPage({super.key});

  @override
  State<JLMainPage> createState() => _JLMainPageState();
}

class _JLMainPageState extends State<JLMainPage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        // selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

