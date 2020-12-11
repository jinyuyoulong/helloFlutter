main(List<String> args) {
  var flag = "abc";
  var aa = null;
  if (aa == null) {
    // 报错了，不是bool类型
    print("我是真的");
  }
}
// 在js中1或任何非null对象的值被视为true
// 在dart中，只有bool值为true被视为true
