// 初始化管理文件
//相对路径
import 'package:flutter/material.dart';
import 'package:hello_flutter/classes/douban/pages/group/group/view.dart';
import 'package:hello_flutter/classes/douban/pages/mall/mall/view.dart';
import 'package:hello_flutter/classes/douban/pages/profile/profile/view.dart';
import 'package:hello_flutter/classes/douban/pages/subject/subject.dart';
import '../home/home.dart';
import 'bottom_bar_item.dart';

List<JLBottomBarItem> items = [
JLBottomBarItem("首页", "home"),
JLBottomBarItem("书影音", "subject"),
JLBottomBarItem("小组", "group"),
JLBottomBarItem("市集", "mall"),
JLBottomBarItem("我的", "profile"),
];

List<Widget> pages = [
  const JLHomePage(),
  const JLSubjectPage(),
  GroupPage(),
  MallPage(),
  ProfilePage(),
];