import 'package:flutter/material.dart';
import 'package:hello_flutter/models/movie_model.dart';
import 'package:hello_flutter/service/home_request.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          return ListTile(
            title: Text("${movies[index].title}"),
            // leading: FadeInImage.memoryNetwork(
            //   width: 30,
            //   height: 30,
            //   // fit: BoxFit.fill,
            //   placeholder: kTransparentImage,
            //   image: '${movies[index].posterUrl}',
            // ),
            leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
                child: CachedNetworkImage(
                  imageUrl: "${movies[index].posterUrl}",
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
            subtitle: Text("${movies[index].posterUrl}"),
          );
        });
  }
}
