main(List<String> args) {
  print(sum(20, 30));
  String userinfo = getPersonInfo(111);
  print(userinfo);
}

// 返回值类型可以省略，自动推断类型（开发不推荐
int sum(int num1, int num2) {
  return num1 + num2;
}

String getPersonInfo(int userId) {
  Map userinfoObj = {"111": "fan", "222": "da"};
  return userinfoObj[userId.toString()];
}
