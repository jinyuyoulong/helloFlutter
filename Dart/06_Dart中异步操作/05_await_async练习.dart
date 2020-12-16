import 'dart:io';

main(List<String> args) {
  print("main start");
  getData().then((value) {
    // 业务代码一般用的then多，
    // 封装的库用的 await多
  }).catchError((err) {
    // 处理异常
  });
  print("main end");
}

Future getData() async {
  // getNetworkData("arg1").then((value) {
  //   print(value);
  //   return getNetworkData(value);
  // }).then((value) {
  //   print(value);
  //   return getNetworkData(value);
  // }).then((value) {
  //   print(value);
  // });

  // 链式调用改为 await async形式
  var result1 = await getNetworkData("arg1");
  print(result1);
  var result2 = await getNetworkData(result1);
  print(result2);
  var result3 = await getNetworkData(result2);
  print(result3);
  return result3;
}

Future getNetworkData(String arg) {
  return Future(() {
    sleep(Duration(seconds: 3));
    return "响应" + arg;
  });
}
