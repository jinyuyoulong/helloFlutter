import 'dart:io';

// 对Future的认知
main(List<String> args) {
  print("main start");
  // 发送一个网络请求
  var resultFuture = getNetworkData();
  print(resultFuture);
  // 2. 拿到结果
  resultFuture.then((String value) {
    print(value);
  }).catchError((err) {
    // 3. 处理异常
    print("拿到 catch error 代码 $err");
  }).whenComplete(() {
    print("异步回调执行完成");
  });

  print("main end");
}

// 模拟网络请求
Future<String> getNetworkData() {
  // sleep(Duration(seconds: 5));
  // return "Hello";
  // 1. 将耗时的操作包裹到Future的回调函数中，future 方法不堵塞主线程
  // 1.1 只要有返回结果，那么就执行future对应的then的回调
  // 1.2 如果没有结果返回(有错误信息),需要在Future回调中抛出一个异常(Promise-reject)
  return Future<String>(() {
    // 耗时操作
    sleep(Duration(seconds: 5));
    // return "Hello";
    throw Exception("我是错误信息");
  });
}

// Future 异步
Future functionName() {
  return Future(() {
    // do something
  });
}
