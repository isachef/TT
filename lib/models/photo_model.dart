// To parse this JSON data, do
//
//     final photoModel = photoModelFromJson(jsonString);

import 'dart:convert';

class PhotoModel {
  PhotoModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int ?albumId;
  int ?id;
  String? title;
  String ?url;
  String ?thumbnailUrl;

  factory PhotoModel.fromRawJson(String str) => PhotoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    albumId: json["albumId"] == null ? null : json["albumId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    url: json["url"] == null ? null : json["url"],
    thumbnailUrl: json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId == null ? null : albumId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "url": url == null ? null : url,
    "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
  };
}
