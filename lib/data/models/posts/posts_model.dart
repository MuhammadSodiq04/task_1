class PostsModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      userId: json["userId"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      body: json["body"] as String? ?? "",
    );
  }
}

//"userId": 1,
//         "id": 1,
//         "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//         "body": "quia et suscipit\nsuscipit recusandae consequuntur ex
