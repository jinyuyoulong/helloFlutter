import 'package:flutter/material.dart';
import 'package:hello_flutter/classes/douban/pages/home/home_movie_item.dart';
import 'package:hello_flutter/classes/douban/utils/log.dart';
import 'package:hello_flutter/models/movie_model.dart';
import 'package:hello_flutter/service/home_request.dart';
import 'package:transparent_image/transparent_image.dart';


class JLHomeContent extends StatefulWidget {
  const JLHomeContent({super.key});

  @override
  State<JLHomeContent> createState() => _JLHomeContentState();
}

class _JLHomeContentState extends State<JLHomeContent> {
  final List<MoviesModel> movies = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 发送网络请求
    HomeRequest.requestMoveList(0).then((res) {
      var trace = StackTrace.current;
      dlog("----", trace);
      print(res);
      setState(() {
        movies.addAll(res);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (ctx, index) {
          return JLHomeMovieItem(movies[index]);
        });
  }
}
