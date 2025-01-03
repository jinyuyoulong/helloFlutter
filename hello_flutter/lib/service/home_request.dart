import 'http_config.dart';
import 'http_request.dart';

class HomeRequest {
  static void requestMoveList(int start) {
// 1.构建 URL
    final movieURL = "?date=2024-12-12&key=f47d84951884e2baf3747a8c7fa9dc48";
        // "/movie/top250?start=$start&count=${HomeConfig.movieCount}";
    HttpRequest.request(movieURL, parames: {}, inter: null).then((res) {
      print(res);
    });
  }
}
