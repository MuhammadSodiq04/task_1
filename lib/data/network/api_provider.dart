import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_1/data/models/posts/posts_model.dart';
import 'package:task_1/data/models/universal_data.dart';

class ApiProvider {
  Future<UniversalData> getAllCurrencies() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    try {
      http.Response response = await http.get(uri,
          headers: {
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
}