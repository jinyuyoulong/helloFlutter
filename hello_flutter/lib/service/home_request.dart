import 'http_config.dart';
import 'http_request.dart';
import 'package:hello_flutter/models/movie_model.dart';

class HomeRequest {
  static Future<List<MoviesModel>> requestMoveList(int start) async {
// 1.构建 URL
//     final movieURL = "?date=2024-12-12&key=f47d84951884e2baf3747a8c7fa9dc48";
        // "/movie/top250?start=$start&count=${HomeConfig.movieCount}";
    const movieURL = "http://localhost:3000/movies";
    final result = await HttpRequest.request(movieURL, parames: {}, inter: null);
    // 将map 转成 model
    List<MoviesModel> movies = [];
    for (var sub in result) {
      movies.add(MoviesModel.fromJson(sub));
    }
    return movies;
  }
}
