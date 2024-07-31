import 'package:flutter/material.dart';

class JLBottomBarItem extends BottomNavigationBarItem {
  JLBottomBarItem(String title,String icon)
      :super(
      icon: Image.asset("assets/images/tabbar/$icon.png", width: 32,),
      activeIcon: Image.asset("assets/images/tabbar/${icon}_active.png", width: 32,),
      label: title
  );
}