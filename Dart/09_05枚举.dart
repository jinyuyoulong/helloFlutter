main(List<String> args) {
  final red = Colors.red;
  switch (red) {
    case Colors.red:
      print("红色");
      break;
    case Colors.blue:
      print("蓝色");
      break;
    case Colors.green:
      print("绿色");
      break;
    default:
      print("无色");
  }
// 枚举两个方法
  print(Colors.values);
  print(Colors.red.index);
}

enum Colors { red, blue, green }
