main(List<String> args) {
  final p1 = Person.withName("fjl");
  final p2 = Person.withName("fjl");
  final p3 = Person.withColor("red");
  final p4 = Person.withColor("red");

  print(identical(p1, p2));
  print(identical(p3, p4));
}

// 需求 传入相同的name时，返回同一个对象，传入color相同时，返回的事同一个对象。
class Person {
  String name;
  String color;

  static final Map<String, Person> _nameCache = {};
  static final Map<String, Person> _colorCache = {};

// 工厂构造函数最大的特点：可以手动返回一个对象。减少了多次对象创建和销毁的过程
// 一但实现构造函数，默认的就没有了
  factory Person.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name]!;
    } else {
      final p = Person(name, "default");
      _nameCache[name] = p;
      return p;
    }
  }

  factory Person.withColor(String color) {
    if (_colorCache.containsKey(color)) {
      return _colorCache[color]!;
    } else {
      final p = Person("name", color);
      _colorCache[color] = p;
      return p;
    }
  }

  Person(this.name, this.color);
}
