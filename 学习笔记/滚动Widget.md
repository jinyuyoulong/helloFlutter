ListView：tableView



GridView ：collectionView



sliver: 本质是这个sliver

ListView构造函数：


ListView.separated


ListView.builder

ListView.custom

GridView构造函数：

GridView()

GridView.count()

GridView.extent()

GridView.builder()



```dart
Widget build(BuildContext context) {
  return ListView.builder(// 展示的时候在加载
    itemExtent: 60,// cell 高度
    itemCount: 100,// item数量
    itemBuilder: (BuildContext context, int index){// 返回的cell
      return Text("$index");
    },
  );
```

```dart
Widget build(BuildContext context) {
  return ListView(
    scrollDirection: Axis.horizontal,// 设置水平滚动，
    itemExtent: 100,// 设置水平滚动，需要设置该值
    children: List.generate(100, (index) {
      return ListTile(
        leading: Icon(Icons.people),
        trailing: Icon(Icons.delete),
        title: Text("联系人${index+1}"),
        subtitle: Text("电话号码：18800000000"),
      );
    }),
  );
```

传入回调函数，一般来讲都是，需要时才会加载回调函数。