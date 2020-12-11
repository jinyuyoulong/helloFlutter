main(List<String> args) {
  // 1. 明确的变量声明
  String name = "fan";

  // 2. 类型推导（var/final/const)
  // 2.1 var 声明变量
  var age = 29;
  age = 30;
  // 2.2 final 声明常量
  final forever = "永恒";
  // 2.3 const 声明常量
  const jingtai = "静态";

  // 2.4 final const 的区别
  // const必须赋值 常量值（编译期间需要有一个确定的值
  // final可以通过计算、函数获取一个值（运行期间确定一个值

  // const date1 = DateTime.now(); x
  final date1 = DateTime.now();

  // final p1 = Person('fan');
  // final p2 = Person('fan');
  // print(identical(p1, p2)); // 判断 p1 ！= p2

  // 希望相同的参数看做同一个对象,严格来说不算 单例模式
  const p1 = Person('fan'); // ==>  const p1 = const Person('fan');
  const p2 = Person('fan');
  const p3 = Person('jin');
  print(identical(p1, p2));
  print(identical(p3, p2));
}

// 如果用const 修饰 构造器，类也必须用 final修饰
class Person {
  final String name;

  const Person(this.name);
}
