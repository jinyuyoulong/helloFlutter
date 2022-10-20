[TOC]

语法：

## 关键字

external 将方法的声明和实现分离 @patch(补丁)，好处是可以针对不同的平台做实现。



变量声明：1. 明确声明 2. 类型推导

```dart
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

```

### 数据类型

// Object 和dynamic

// dynamic 是明确声明，和var不一样

// Object调用方法时，编译时会报错

// dynamic调用方法时，编译时不会报错，但是运行时存在安全隐患 

### 非零即真

在js中1或任何非null对象的值被视为true

在dart中，只有bool值为true被视为true

### 字符串

```dart
var str1 = '单引号';
  var str2 = "双引号";
  var str3 = """
  模板
  字符串
  """;

  // 字符串和表达式进行拼接，和ES6一样
  var name = "fan";
  var age = 19;
  var height = 1.88;

// 强调：${变量} 那么{} 可以省略
  var message1 = "my name is ${name}, $age, $height";
  var message2 = "my name is ${name}, ${name.runtimeType}";
```



### 集合类型

```
  // 1. 列表 数组 list
  // 2. 集合 set
  // 3. 映射 对象 字典 map

  var names = ["1", "2", "3"];
  var movies = {"星际穿越", "xiyou", "道明空间"};
  var info = {"name": "fan", "age": 18}; // key 必须可hash
```



### 可选值 null 检查最佳实践

```
bool isConnected(a,b){
	bool outConn=outgoing[a]?.contains(b) ?? false;
	bool inConn = incoming[a]?.contains(b) ?? false;
	return outConn || inConn;
}
```

`?.`运算符在左边为null的情况下会阻断右边的调用，`??` 运算符主要作用是在左侧表达式为null时为其设置默认值。

对于表达式：

```
outgoing[a]?.contains(b)
```

如果outgoing为null 或 outgoing[a]为null或contains(b)的值为null，都会导致表达式为null



## function 函数是一等公民

面向对象语言中，对象是一等公民。一等公民可以做参数，返回值，传递。

```
JS
function demo(){}
Dart
demo(){}

// 必选参数
// 可选参数：1. 位置可选，2. 命名可选
// 位置可选参数：[int age,double height]
// 实参和形参在进行匹配时，是根据位置的匹配
// 注意 ，只有可选参数可以有默认值
void sayHello1(String name) {
  print(name);
}

//位置可选参数
void sayHello2(String name, [int age, double height]) {
  print(name);
}

// 命名可选参数
void sayHello3(String name, {int age, double height = 0}) {
  print(name);
}
//三种函数传入方式
 // 1. 直接传方法名，对函数没有任何限制（参数，返回值）
  test(bar);
//2.  匿名函数 （参数列表){函数体}
  test(() {
    print("匿名函数被调用");
  });

  //3.  箭头函数：条件，函数体只有一行代码
  test(() => print("箭头函数被调用"));
```



## 运算符

```dart
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
```

## 流程控制



## 异步编程

### future == promise

JS中Promise对象表示异步操作的最终完成（或失败）及其结果值，Dart中使用Future来表示异步操作。

```dart
import 'dart:convert';
import 'dart:html';

main(List<String> args) {
  _getIPAddress() {
    final url = "https://httpbin.org/ip";
    Future<HttpRequest> request = HttpRequest.request(url);
    request.then((value) {
      print(jsonDecode(value.responseText)['origin']);
    }).catchError((error) => print(error));
  }

  _getIPAddress();
}

```



### async 和 await



## 类

### 单继承，使用混合方式实现多继承mixin

```dart

// 如果用const 修饰 构造器，类也必须用 final修饰
class Person {
  final String name;

  const Person(this.name);
}
class Person {
  final String name;
  final int age;

// 源自C++中的初始化列表
// 如下常用方式
// 这种初始化方法可以使用表达式
// 另外一种命名可选参数的初始化方式只能使用直接赋值
  Person(this.name, {int age}) : this.age = age ?? 10 {}
  // Person(this.name,{int age = 10})
}
class Person1 {
  String name;
  int age;
  // 同名方法为构造函数
  Person(int age, String name) {
    this.age = age;
    this.name = name;
  }
  
  void sayHello() {
    print("my name is $name");
  }
}

class Eat {
  void eat() {
    print("eat");
  }
}

class Sleep {
  void sleep() {
    print("sleeep");
  }
}

// 抽象类 不能被实例化，通常用于架构师来设计编码格式
abstract class Animal {
  void run(); // 抽象方法
  // 抽象类的用处：我有一个想法，但是不知道怎么实现，提醒继承者去实现
}

// 多继承 混合
class Person2 extends Animal with Eat, Sleep {
  String name;
  int age;
  // 同名方法为构造函数
  Person2(int age, String name) {
    this.age = age;
    this.name = name;
  }

  void sayHello() {
    print("my name is $name");
  }

  @override
  void run() {
    print("haha run");
  }
}

```

混合的菱形继承问题：编译后，最近原则调用方法。先找自身的，再找with后面，从后往前以此调用。

### 多核CPU的利用
Isolate概念 隔离
Dart是单线程的，线程所在的空间被称为Isolate。比如Flutter中有一个Root
Isolate，负责运行Flutter代码，例如UI渲染，用户交互等。
在Isolate中，资源隔离做的非常好，每个Isolate有自己的Event Loop和Queue。
- Isolate之间不共享任何资源，只能依靠消息机制通信，因此也就没有资源抢占问题。
这不就是多进程方案！
