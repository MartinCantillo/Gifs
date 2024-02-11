//To parse this JSON data, do
//
//     final gifs = gifsFromJson(jsonString);

import 'dart:convert';

class Datum {
  final String url;

  final String title;

  Datum({
    required this.url,
    required this.title,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        url: json["images"] ["downsized"]["url"]?? "",
        title: json["title"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "title": title,
      };
}
