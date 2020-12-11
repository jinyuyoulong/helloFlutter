main(List<String> args) {
  // 赋值操作 ??= 当变量有值时，??= 不执行
// 变量为null，将值赋值给变量
  var name = "fan";
  name ??= "jin";
  print(name);

// ??
// 前面变量有值，使用变量的值
// 前面变量无值，返回?? 后边的值。可以理解为三目运算符的简写
  var temp = name ?? "is";
  print(temp);

  // 级联运算符
  var p = Person()
    ..name = "ming"
    ..eat()
    ..run();
}

class Person {
  String name;
  void eat() {
    print("eating");
  }

  void run() {
    print("runing");
  }
}
