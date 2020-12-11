main(List<String> args) {
  // 1. 直接传方法名，对函数没有任何限制（参数，返回值）
  test(bar);
//2.  匿名函数 （参数列表){函数体}
  test(() {
    print("匿名函数被调用");
  });

  //3.  箭头函数：条件，函数体只有一行代码
  test(() => print("箭头函数被调用"));

  test2((num1, num2) {
    return num1 * num2;
  });
  var demo1 = demo();
  print(demo1(20, 30));
}

// 函数可以作为另一个函数的参数
void test(Function foo) {
  foo();
}

void bar() {
  print("bar 被调用 called");
}

// 传入代参数的方法作为参数
void test1(int foo(int num1, int num2)) {}

// 实际使用，这样用：
typedef Calculate = int Function(int num1, int num2);
void test2(Calculate calc) {
  calc(20, 30);
}

Calculate demo() {
  return (num1, num2) {
    return num1 * num2;
  };
}
