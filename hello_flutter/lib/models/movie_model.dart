// To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);

import 'dart:convert';

List<MoviesModel> moviesModelFromJson(String str) => List<MoviesModel>.from(
    json.decode(str).map((x) => MoviesModel.fromJson(x)));

String moviesModelToJson(List<MoviesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoviesModel {
  String title;
  String posterUrl;
  DateTime? releaseDate;
  String? overview;

  MoviesModel({
    required this.title,
    required this.posterUrl,
    this.releaseDate,
    this.overview,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        title: json["title"],
        posterUrl: json["posterUrl"],
        releaseDate: json["releaseDate"] == null
            ? null
            : DateTime.parse(json["releaseDate"]),
        overview: json["overview"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "posterUrl": posterUrl,
        "releaseDate":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "overview": overview,
      };

  @override
  String toString() {
    return 'MoviesModel{title: $title, posterUrl: $posterUrl, releaseDate: $releaseDate, overview: $overview}';
  }
}
