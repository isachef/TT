// To parse this JSON data, do
//
//     final commentsModel = commentsModelFromJson(jsonString);

import 'dart:convert';

class CommentsModel {
  CommentsModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int ?postId;
  int ?id;
  String? name;
  String ?email;
  String ?body;

  factory CommentsModel.fromRawJson(String str) => CommentsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
    postId: json["postId"] == null ? null : json["postId"],
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    body: json["body"] == null ? null : json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId == null ? null : postId,
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "body": body == null ? null : body,
  };
}
