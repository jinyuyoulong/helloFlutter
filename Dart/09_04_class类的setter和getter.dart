main(List<String> args) {
  final p = Person();
  // 属性直接访问；
  p.name = "fan";
  print(p.name);

  // 通过setter和getter访问变量
  p.setAge = "10";
  print(p.getAge);

  var m = Map();
  print(m.runtimeType);
}

class Person {
  // 加下划线就是私有的属性。不加就是公有地。没有public等权限关键字
  String _age = "";
  String name = "";

  // setter 可以对属性进行监听
  // set setName(String name) {
  //   this.name = name;
  // }
  set setAge(String age) => this._age = age;
  set setName(String name) => this.name = name;

  // getter
  // String get getName {
  //   return name;
  // }\
  String get getAge => _age;
  String get getName => name;
}
