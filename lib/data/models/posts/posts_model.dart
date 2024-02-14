//"userId": 1,
//"id": 1,
//"title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//"body": "quia et suscipit\nsuscipit recusandae consequuntur ex

import 'package:hive/hive.dart';
import 'dart:convert';

part 'posts_model.g.dart';

PostsModel postsModelFromJson(String str) => PostsModel.fromJson(json.decode(str));

String postsModelToJson(PostsModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class PostsModel {
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final int id;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String body;

  PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  PostsModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      PostsModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}

