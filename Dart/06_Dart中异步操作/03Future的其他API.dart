main(List<String> args) {
  // Future(() {
  //   return "Hello";
  // }).then((value) {
  //   print(value);
  // });

  // 上述方式的简写
  Future.value("简便写法").then((res) {
    print(res);
  });

  Future.error("错误信息").catchError((value) {
    print(value);
  });

  //延时执行
  Future.delayed(Duration(seconds: 3)).then((value) {
    return "你好";
  }).then((value) {
    print(value);
  });
}
