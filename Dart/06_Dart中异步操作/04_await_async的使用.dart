// await async 是Dart中的关键字，一般是返回Future
import 'dart:io';

main(List<String> args) {
  print("main start");
  var result = getNetworkData();
  print(result);
  print("main end");
}

/**
 * 1. await必须在async函数中才能使用
 * 2. async函数返回的结果必须是一个Future
 */
Future getNetworkData() async {
  await sleep(Duration(seconds: 3));
  return "响应";
}
