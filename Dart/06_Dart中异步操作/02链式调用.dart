import 'dart:io';

main(List<String> args) {
  Future(() {
    sleep(Duration(seconds: 3));
    return "第一次网络 返回结果";
    // throw Exception("第一次异常");
  }).then((value) {
    print(value);
    sleep(Duration(seconds: 2));
    return "第二次网络 返回结果";
  }).then((value) {
    print(value);
    sleep(Duration(seconds: 1));
    return "第三次网络 返回结果";
  }).then((value) {
    print(value);
  }).catchError((err) {
    print("链式调用中抛出的 error: $err");
  });
}
