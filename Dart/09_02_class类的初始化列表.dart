main(List<String> args) {
  var p = Person("name");
}

class Person {
  final String name;
  final int age;

// 源自C++中的初始化列表
// 如下常用方式
// 这种初始化方法可以使用表达式
// 另外一种命名可选参数的初始化方式只能使用直接赋值
  Person(this.name, {int? age}) : this.age = age ?? 10 {}
  // Person(this.name,{int age = 10})
}
