import 'package:flutter/material.dart';
import 'package:hello_flutter/classes/douban/utils/log.dart';
import 'package:hello_flutter/classes/douban/widgets/dashed_line.dart';
import 'package:hello_flutter/classes/douban/widgets/star_rating.dart';
import 'package:hello_flutter/models/movie_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class JLHomeMovieItem extends StatelessWidget {
  final MoviesModel model;
  const JLHomeMovieItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 8, color: Color(0xffcccccc))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          SizedBox(height: 8),
          buildContent(),
          SizedBox(height: 8),
          buildFooter(),
        ],
      ),
    );
  }

  // 1 头部的排名
  Widget buildHeader() {
    return Container(
      // height: 40,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "No.${model.title}",
        style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  // 2 内容
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildContentTitle(),
              SizedBox(height: 10),
              buildContentRade(),
              SizedBox(height: 10),
              buildContentDesc(),
            ],
          ),
        ),
        SizedBox(width: 8),
        buildContentLine(),
        SizedBox(width: 8),
        buildContentWish(),
      ],
    );
  }

  Widget buildContentImage() {
    return ClipRRect(
      // 加圆角
      borderRadius: BorderRadius.circular(8),
      child: Image.network("${model.posterUrl}", height: 150),
    );
  }

  Widget buildContentTitle() {

    // dlog("---", StackTrace.current);
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.play_circle_fill_outlined,
              color: Colors.redAccent,
            ),
            alignment: PlaceholderAlignment.middle
          ),
          WidgetSpan(
            child: Text("${model.title}",
                style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            alignment: PlaceholderAlignment.middle
          ),
          WidgetSpan(
            child: Text(
              "(1990)",
                style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            alignment: PlaceholderAlignment.middle
          ),
        ],
      ),
    );
  }

  Widget buildContentRade() {
    return Row(
      children: [
        StartRating(rating: 7, size: 20),
        Text("7.0", style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget buildContentDesc() {
    return Text(
      model.posterUrl,
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
  }

  // 3 分割线
  Widget buildContentLine() {
    return Container(
      height: 120,
      child: DashedLine(
        axis: Axis.vertical,
        dashedHeight: 6,
        dashedWidth: .4,
        count: 10,
      ),
    );
  }

  // 4 内容的想看
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.linked_camera, color: Colors.pinkAccent),
          Text("想看", style: TextStyle(fontSize: 16, color: Colors.pinkAccent)),
        ],
      ),
    );
  }

  // 5 cell footer
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xffe2e2e2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        "${model.releaseDate}",
        style: TextStyle(fontSize: 12, color: Color(0xff666666)),
      ),
    );
  }
}
