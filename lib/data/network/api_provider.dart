import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_1/data/models/comments/comments_model.dart';
import 'package:task_1/data/models/photos/photos_model.dart';
import 'package:task_1/data/models/posts/posts_model.dart';
import 'package:task_1/data/models/universal_data.dart';
import 'package:task_1/data/models/users/users_model.dart';

class ApiProvider {
  final String baseUrl = "jsonplaceholder.typicode.com";

  Future<UniversalData> getAllPosts() async {
    Uri uri = Uri.http(baseUrl, "/posts");

    try {
      http.Response response = await http.get(uri, headers: {
        "Accept": "application/json",
      });
      // print(response.body);
      return UniversalData(
        data: (jsonDecode(response.body) as List?)
                ?.map((e) => PostsModel.fromJson(e))
                .toList() ??
            [],
      );
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getAllPhotos({
        required int page,
        required int count,
      }) async {
    Uri uri = Uri.https(baseUrl, "/photos",
    {
      "_page": page.toString(),
      "page&_limit": count.toString()
    });

    try {
      http.Response response = await http.get(uri, headers: {
        "Accept": "application/json",
      });
      // print(response.body);
      return UniversalData(
        data: (jsonDecode(response.body) as List?)
                ?.map((e) => PhotosModel.fromJson(e))
                .toList() ??
            [],
      );
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getAllComments({
    required int page,
    required int count,
  }) async {
    Uri uri = Uri.parse("https://$baseUrl/comments?_page=${page}page&_limit=$count");

    try {
      http.Response response = await http.get(uri, headers: {
        "Accept": "application/json",
      });
      // print(response.body);
      return UniversalData(
        data: (jsonDecode(response.body) as List?)
                ?.map((e) => CommentsModel.fromJson(e))
                .toList() ??
            [],
      );
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getAllUsers() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/users");

    try {
      http.Response response = await http.get(uri, headers: {
        "Accept": "application/json",
      });
      // print(response.body);
      return UniversalData(
        data: (jsonDecode(response.body) as List?)
                ?.map((e) => UsersModel.fromJson(e))
                .toList() ??
            [],
      );
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
