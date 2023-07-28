// 默认下所有的类都继承自object
// Object和dynamic很类似
// dart 没有 interface等关键字声明接口，而是默认所有类都是隐式接口
// 当把类当做接口使用，那么类必须实现接口类的所有方法
import 'dart:html';

main(List<String> args) {
  // final p1 = Person('fan');
  // final p2 = Person('fan');
  // print(identical(p1, p2)); // 判断 p1 ！= p2

  // 希望相同的参数看做同一个对象,严格来说不算 单例模式
  const p1 = Person('fan'); // ==>  const p1 = const Person('fan');
  const p2 = Person('fan');
  const p3 = Person('jin');
  print(identical(p1, p2));
  print(identical(p3, p2));
  final pp1 = Person1(11, "fan");
  pp1.sayHello();

  final worker = Worker(12, "w", 20);
  worker.sayHello();

  final p22 = Person2(11, "das");
  p22.eat();

// dynamic 是明确声明，和var不一样
// Object调用方法时，编译时会报错
// dynamic调用方法时，编译时不会报错，但是运行时存在安全隐患
  dynamic obj = "why";
  print(obj.substring(1));

  var p = Person1.fromMap({"name": "fan", "age": 13, "height": 12.34});
  print(p.toString());
}

// 如果用const 修饰 构造器，类也必须用 final修饰
class Person {
  final String name;
  // 类属性，静态属性
  static int? age;
  // 类方法
  static void callClass() {
    print("person");
  }

//
  const Person(this.name);
}

// dart 没有方法重载
class Person1 {
  late String name;
  int? age;
  double? height;

  // 同名方法为构造函数
  Person1(int age, String name) {
    this.age = age;
    this.name = name;
  }
  // 命名构造函数
  Person1.withHeight(this.age, this.name, this.height);
  Person1.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.age = map["age"];
    this.height = map["height"];
  }

  @override
  String toString() {
    return "$name $age $height";
  }

  void sayHello() {
    print("my name is $name");
  }
}

class Worker extends Person1 {
  late int salary;
  // 初始化列表
  // 构造函数的重定向 Person(String name): this._internal(name)
  Worker(int age, String name, int salary) : super(age, name) {
    this.salary = salary;
  }
  @override
  void sayHello() {
    print("my salary is : $salary");
  }
}

mixin class Eat {
  void eat() {
    print("eat");
  }
}

mixin Sleep {
  void sleep() {
    print("sleeep");
  }
}

// 抽象类 不能被实例化，通常用于架构师来设计编码格式
abstract class Animal {
  void run(); // 抽象方法
  // 抽象类的用处：我有一个想法，但是不知道怎么实现，提醒继承者去实现

  // 但是抽象类可以用工厂方法实例化,比如 Map List
  // factory Animal() {
  //   return Person2(13, "name");
  // }
}

// 多继承 混合
// dart 没有 interface等关键字声明接口，而是默认所有类都是隐式接口
class Person2 extends Animal with Eat, Sleep {
  String name = "";
  int age = 0;
  // 同名方法为构造函数
  Person2(int age, String name) {
    this.age = age;
    this.name = name;
  }

  void sayHello() {
    print("my name is $name");
  }

// 抽象类的方法，必须被子类实现
  @override
  void run() {
    print("haha run");
  }
}

// dart 没有 interface等关键字声明接口，而是默认所有类都是隐式接口
// 当把类当做接口使用，那么类必须实现接口类的所有方法
class Person3 implements Eat, Sleep {
  @override
  void eat() {
    print("dd");
  }

  @override
  void sleep() {
    print("p3 sleep");
  }
}
