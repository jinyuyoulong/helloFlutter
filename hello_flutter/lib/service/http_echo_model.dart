// To parse this JSON data, do
//
//     final httpEchoModel = httpEchoModelFromJson(jsonString);

import 'dart:convert';

HttpEchoModel httpEchoModelFromJson(String str) => HttpEchoModel.fromJson(json.decode(str));

String httpEchoModelToJson(HttpEchoModel data) => json.encode(data.toJson());

class HttpEchoModel {
  HttpEchoModel({
    this.args,
    this.headers,
    this.origin,
    this.url,
  });

  Args? args;
  Headers? headers;
  String? origin;
  String? url;

  factory HttpEchoModel.fromJson(Map<String, dynamic> json) => HttpEchoModel(
    args: json["args"] == null ? null : Args.fromJson(json["args"]),
    headers: json["headers"] == null ? null : Headers.fromJson(json["headers"]),
    origin: json["origin"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "args": args?.toJson(),
    "headers": headers?.toJson(),
    "origin": origin,
    "url": url,
  };
}

class Args {
  Args({
    this.name,
  });

  String? name;

  factory Args.fromJson(Map<String, dynamic> json) => Args(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Headers {
  Headers({
    this.accept,
    this.acceptEncoding,
    this.acceptLanguage,
    this.host,
    this.userAgent,
    this.xAmznTraceId,
  });

  String? accept;
  String? acceptEncoding;
  String? acceptLanguage;
  String? host;
  String? userAgent;
  String? xAmznTraceId;

  factory Headers.fromJson(Map<String, dynamic> json) => Headers(
    accept: json["Accept"],
    acceptEncoding: json["Accept-Encoding"],
    acceptLanguage: json["Accept-Language"],
    host: json["Host"],
    userAgent: json["User-Agent"],
    xAmznTraceId: json["X-Amzn-Trace-Id"],
  );

  Map<String, dynamic> toJson() => {
    "Accept": accept,
    "Accept-Encoding": acceptEncoding,
    "Accept-Language": acceptLanguage,
    "Host": host,
    "User-Agent": userAgent,
    "X-Amzn-Trace-Id": xAmznTraceId,
  };
}
