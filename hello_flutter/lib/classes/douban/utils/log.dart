void dlog(String msg, StackTrace current) {
  FCustomTrace programeInfo = FCustomTrace(current);
  print("${msg} 文件名称: ${programeInfo.fileName} line ${programeInfo.lineNumber.toString()}");
}

class FCustomTrace {
  final StackTrace _trace;

  late String fileName;
  late int lineNumber;
  late int columnNumber;

  FCustomTrace(this._trace) {
    _parseTrace();
  }
  void _parseTrace() {
    var traceString = _trace.toString().split("\n")[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listFileInfos = fileInfo.split(":");
    fileName = listFileInfos[0];
    lineNumber = int.parse(listFileInfos[1]);
    var columnStr = listFileInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    columnNumber = int.parse(columnStr);
  }
}

