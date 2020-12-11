main(List<String> args) {
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
  print(message1);
  print(message2);
}
