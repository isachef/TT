// To parse this JSON data, do
//
//     final albumModel = albumModelFromJson(jsonString);

import 'dart:convert';

class AlbumModel {
  AlbumModel({
    this.userId,
    this.id,
    this.title,
  });

  int ?userId;
  int ?id;
  String? title;

  factory AlbumModel.fromRawJson(String str) => AlbumModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
    userId: json["userId"] == null ? null : json["userId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
  };
}
