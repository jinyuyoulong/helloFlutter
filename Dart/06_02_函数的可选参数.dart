// 必选参数
// 可选参数：1. 位置可选，2. 命名可选
// 位置可选参数：[int age,double height]
// 实参和形参在进行匹配时，是根据位置的匹配
// 注意 ，只有可选参数可以有默认值
void sayHello1(String name) {
  print(name);
}

void sayHello2(String name, [int? age, double? height]) {
  print(name);
}

// 命名可选参数
void sayHello3(String name, {int? age, double? height}) {
  print(name);
}
main(List<String> args) {
  sayHello1("dd");
  sayHello2("aa", 18, 1.88);
  sayHello3("name", age: 19);
}