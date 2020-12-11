main(List<String> args) {
  // isConnected(1, 2);
  print(null ?? false);
  print(false ?? 1);
  print(true ?? false);
//   false
// false
// true
// 说明 只有null会导致 ?? 运算符执行
}

var outgoing = [1, 2];
var incoming = [2, 3];

// bool isConnected(a, b) {
//   bool outConn = outgoing[a]?.contains(b) ?? false;
//   bool inConn = incoming[a]?.contains(b) ?? false;
//   return outConn || inConn;
// }
