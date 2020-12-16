import 'dart:isolate';

main(List<String> args) {
  print("main start");

  // Isolate 基本使用
  // Isolate.spawn(calc, 100);
  foo();
  print("main end");
}

void calc(int count) {
  var total = 0;
  for (var i = 0; i < count; i++) {
    total += i;
  }
  print(total);
}

// ======================= 通信 =============================
// 1. 创建管道
// 2. 创建 Isolate
// 3. 监听管道信息
void foo() async {
  ReceivePort receivePort = ReceivePort();
  Isolate isolate = await Isolate.spawn<SendPort>(foo1, receivePort.sendPort);
  receivePort.listen((message) {
    print(message);
    receivePort.close(); // 关闭监听
    isolate.kill(); // kill 杀掉进程
  });
}

void foo1(SendPort send) {
  send.send("发送管道信息");
}
