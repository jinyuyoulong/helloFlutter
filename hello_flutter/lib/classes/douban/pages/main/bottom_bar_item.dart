import 'package:flutter/material.dart';
/*
* gaplessPlayback 无间隙播放
* */
class JLBottomBarItem extends BottomNavigationBarItem {
  JLBottomBarItem(String title,String icon)
      :super(
      icon: Image.asset("assets/images/tabbar/$icon.png", width: 32,gaplessPlayback: true,),
      activeIcon: Image.asset("assets/images/tabbar/${icon}_active.png", width: 32,gaplessPlayback: true,),
      label: title
  );
}