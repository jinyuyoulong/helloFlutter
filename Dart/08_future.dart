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
