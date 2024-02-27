import 'dart:convert';
import 'dart:io';

/*
由于 Dart 是单线程的，所以如果需要执行耗时操作，那么就需要使用 Future
*/
main(List<String> args) {
  print("main start");
// 1. 发送一个网络请求
  var future = getIPAddress();
// 2. 拿到结果， then 会在 future 完成之后执行
  future.then((String value) {
    print(value);
  }).catchError((error) {
    print("拿到 catch error 代码 $error");
  }).whenComplete(() {
    print("异步回调执行完成");
  });
  print("main end");
}

Future<String> getIPAddress() {
  return Future<String>(() {
    sleep(Duration(seconds: 3));
    return "hello";
  });
}
